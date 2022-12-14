# -*- coding: utf-8 -*-

from collections import defaultdict

from matplotlib import ticker

from downward.reports.scatter import ScatterPlotReport
#from downward.reports.plot import PlotReport, Matplotlib, 
from downward.reports.scatter_matplotlib import ScatterMatplotlib, MatplotlibPlot

# TODO: handle outliers

# TODO: this is mostly copied from ScatterMatplotlib (scatter.py)
class RelativeScatterMatplotlib(ScatterMatplotlib):
    @classmethod
    def _plot(cls, report, axes, categories, styles):
        # Display grid
        axes.grid(b=True, linestyle='-', color='0.75')

        has_points = False
        # Generate the scatter plots
        for category, coords in sorted(categories.items()):
            X, Y = zip(*coords)
            axes.scatter(X, Y, s=42, label=category, **styles[category])
            if X and Y:
                has_points = True

        if report.xscale == 'linear' or report.yscale == 'linear':
            plot_size = report.missing_val * 1.01
        else:
            plot_size = report.missing_val * 1.25

        # make 5 ticks above and below 1
        yticks = []
        tick_step = report.ylim_top**(1/5.0)
        for i in xrange(-5, 6):
            yticks.append(tick_step**i)
        axes.set_yticks(yticks)
        axes.get_yaxis().set_major_formatter(ticker.ScalarFormatter())

        axes.set_xlim(report.xlim_left or -1, report.xlim_right or plot_size)
        axes.set_ylim(report.ylim_bottom or -1, report.ylim_top or plot_size)

        for axis in [axes.xaxis, axes.yaxis]:
            MatplotlibPlot.change_axis_formatter(
                axis,
                report.missing_val if report.show_missing else None)
        return has_points


class RelativeScatterPlotReport(ScatterPlotReport):
    """
    Generate a scatter plot that shows a relative comparison of two
    algorithms with regard to the given attribute. The attribute value
    of algorithm 1 is shown on the x-axis and the relation to the value
    of algorithm 2 on the y-axis.
    """

    def __init__(self, show_missing=True, get_category=None, **kwargs):
        ScatterPlotReport.__init__(self, show_missing, get_category, **kwargs)
        if self.output_format == 'tex':
            raise "not supported"
        else:
            self.writer = RelativeScatterMatplotlib

    def _fill_categories(self, runs):
        # We discard the *runs* parameter.
        # Map category names to value tuples
        categories = defaultdict(list)
        self.ylim_bottom = 2
        self.ylim_top = 0.5
        self.xlim_left = float("inf")
        for (domain, problem), runs in self.problem_runs.items():
            if len(runs) != 2:
                continue
            run1, run2 = runs
            assert (run1['algorithm'] == self.algorithms[0] and
                    run2['algorithm'] == self.algorithms[1])
            val1 = run1.get(self.attribute)
            val2 = run2.get(self.attribute)
            if val1 is None or val2 is None:
                continue
            category = self.get_category(run1, run2)
            assert val1 > 0, (domain, problem, self.algorithms[0], val1)
            assert val2 > 0, (domain, problem, self.algorithms[1], val2)
            x = val1
            y = val2 / float(val1)

            categories[category].append((x, y))

            self.ylim_top = max(self.ylim_top, y)
            self.ylim_bottom = min(self.ylim_bottom, y)
            self.xlim_left = min(self.xlim_left, x)

        # center around 1
        if self.ylim_bottom < 1:
            self.ylim_top = max(self.ylim_top, 1 / float(self.ylim_bottom))
        if self.ylim_top > 1:
            self.ylim_bottom = min(self.ylim_bottom, 1 / float(self.ylim_top))
        return categories

    def _set_scales(self, xscale, yscale):
        # ScatterPlot uses log-scaling on the x-axis by default.
        ScatterPlotReport._set_scales(
            self, xscale or self.attribute.scale or 'log', 'log')
