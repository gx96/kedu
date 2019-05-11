<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"
		 errorPage="errorPage.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../include/admin/adminHeader.jsp" %>
<%@include file="../include/admin/adminNavigator.jsp" %>
<title>销售统计</title>
<div class="StatisticsDiv">
	<%@include file="../include/admin/adminNavigatorleft.jsp" %>
	<div id="container" class="containerDiv"></div>
	<script>
        // var chart = Highcharts.chart('container', {
        //     title: {
        //         text: '2010 ~ 2016 年太阳能行业就业人员发展情况'
        //     },
        //     subtitle: {
        //         text: '数据来源：thesolarfoundation.com'
        //     },
        //     yAxis: {
        //         title: {
        //             text: '就业人数'
        //         }
        //     },
        //     legend: {
        //         layout: 'vertical',
        //         align: 'right',
        //         verticalAlign: 'middle'
        //     },
        //     plotOptions: {
        //         series: {
        //             label: {
        //                 connectorAllowed: false
        //             },
        //             pointStart: 2010
        //         }
        //     },
        //     series: [{
        //         name: '安装，实施人员',
        //         data: [43934, 52503, 57177, 69658, 97031, 119931, 137133, 154175]
        //     }, {
        //         name: '工人',
        //         data: [24916, 24064, 29742, 29851, 32490, 30282, 38121, 40434]
        //     }, {
        //         name: '销售',
        //         data: [11744, 17722, 16005, 19771, 20185, 24377, 32147, 39387]
        //     }, {
        //         name: '项目开发',
        //         data: [null, null, 7988, 12169, 15112, 22452, 34400, 34227]
        //     }, {
        //         name: '其他',
        //         data: [12908, 5948, 8105, 11248, 8989, 11816, 18274, 18111]
        //     }],
        //     responsive: {
        //         rules: [{
        //             condition: {
        //                 maxWidth: 500
        //             },
        //             chartOptions: {
        //                 legend: {
        //                     layout: 'horizontal',
        //                     align: 'center',
        //                     verticalAlign: 'bottom'
        //                 }
        //             }
        //         }]
        //     }
        // });

        var options={
            title: {
                text: '本月销售统计' //标题
            },
            subtitle: {
                text: ''			//小标题
            },
            yAxis: {
                title: {
                    text: '销售额'	//y轴标题
                }
            },
            legend: {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'middle'
            },
            plotOptions: {
                series: {
                    label: {
                        connectorAllowed: false
                    },
                    pointStart: 2010
                }
            },
            series: [{//数据列
                name: '安装，实施人员',//数据列名
                data: [43934, 52503, 57177, 69658, 97031, 119931, 137133, 154175]//数据
            }, {
                name: '工人',
                data: [24916, 24064, 29742, 29851, 32490, 30282, 38121, 40434]
            }, {
                name: '销售',
                data: [11744, 17722, 16005, 19771, 20185, 24377, 32147, 39387]
            }, {
                name: '项目开发',
                data: [null, null, 7988, 12169, 15112, 22452, 34400, 34227]
            }, {
                name: '其他',
                data: [12908, 5948, 8105, 11248, 8989, 11816, 18274, 18111]
            }],
            responsive: {
                rules: [{
                    condition: {
                        maxWidth: 1000
                    },
                    chartOptions: {
                        legend: {
                            layout: 'horizontal',
                            align: 'center',
                            verticalAlign: 'bottom'
                        }
                    }
                }]
            }
        };
        var chart = Highcharts.chart('container', options);//图表初始化函数
	</script>
</div>
<%@include file="../include/admin/adminFooter.jsp" %>
