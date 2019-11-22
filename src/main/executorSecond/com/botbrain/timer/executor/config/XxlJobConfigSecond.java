package com.botbrain.timer.executor.config;

import com.xxl.job.core.executor.impl.XxlJobSpringExecutor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.DependsOn;
import org.springframework.core.annotation.Order;

import javax.annotation.PostConstruct;

/**
 * xxl-job config
 *
 * @author xuxueli 2017-04-28
 */

@Configuration
public class XxlJobConfigSecond {
    XxlJobConfigSecond(){
        System.out.println("XxlJobConfigSecond...................................................");
    }

    @PostConstruct
    public void test() {
        System.out.println("PostConstruct-----XxlJobConfigSecond...................................................");
    }
    private Logger logger = LoggerFactory.getLogger(XxlJobConfigSecond.class);

    @Value("${xxl.job.admin.addresses.second}")
    private String adminAddresses;

    @Value("${xxl.job.executor.appname.second}")
    private String appName;

    @Value("${xxl.job.executor.ip.second}")
    private String ip;

    @Value("${xxl.job.executor.port.second}")
    private int port;

    @Value("${xxl.job.executor.accessToken.second}")
    private String accessToken;

    @Value("${xxl.job.executor.logpath.second}")
    private String logPath;

    @Value("${xxl.job.executor.logretentiondays.second}")
    private int logRetentionDays;


    @Bean(initMethod = "start", destroyMethod = "destroy",value = "xxlJobExecutorSecond")
    public XxlJobSpringExecutor xxlJobExecutorSecond() {
        logger.info(">>>>>>>>>>> xxl-job config second init.");
        XxlJobSpringExecutor xxlJobSpringExecutor = new XxlJobSpringExecutor();
        xxlJobSpringExecutor.setAdminAddresses(adminAddresses);
        xxlJobSpringExecutor.setAppName(appName);
        xxlJobSpringExecutor.setIp(ip);
        xxlJobSpringExecutor.setPort(port);
        xxlJobSpringExecutor.setAccessToken(accessToken);
        xxlJobSpringExecutor.setLogPath(logPath);
        xxlJobSpringExecutor.setLogRetentionDays(logRetentionDays);

        return xxlJobSpringExecutor;
    }

    /**
     * 针对多网卡、容器内部署等情况，可借助 "spring-cloud-commons" 提供的 "InetUtils" 组件灵活定制注册IP；
     *
     *      1、引入依赖：
     *          <dependency>
     *             <groupId>org.springframework.cloud</groupId>
     *             <artifactId>spring-cloud-commons</artifactId>
     *             <version>${version}</version>
     *         </dependency>
     *
     *      2、配置文件，或者容器启动变量
     *          spring.cloud.inetutils.preferred-networks: 'xxx.xxx.xxx.'
     *
     *      3、获取IP
     *          String ip_ = inetUtils.findFirstNonLoopbackHostInfo().getIpAddress();
     */


}