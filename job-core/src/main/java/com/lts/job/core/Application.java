package com.lts.job.core;

import com.lts.job.core.cluster.MasterElector;
import com.lts.job.core.cluster.NodeManager;
import com.lts.job.core.registry.PathParser;
import com.lts.job.core.registry.ZkPathParser;
import com.lts.job.core.domain.JobNodeConfig;
import com.lts.job.core.protocol.command.CommandBodyWrapper;

import java.util.concurrent.ConcurrentHashMap;

/**
 * @author Robert HG (254963746@qq.com) on 8/17/14.
 * 用来存储 程序的数据
 */
public class Application {

    private final ConcurrentHashMap<String, Object> keyValue = new ConcurrentHashMap<String, Object>();

    public void setAttribute(String key, Object value) {
        keyValue.put(key, value);
    }

    public <T> T getAttribute(String key) {
        Object object = keyValue.get(key);
        if (object == null) {
            return null;
        }

        return (T) object;
    }

    // 节点配置信息
    private JobNodeConfig config;
    // 节点管理
    private NodeManager nodeManager;
    // master节点选举者
    private MasterElector masterElector;
    // 节点通信CommandBody包装器
    private CommandBodyWrapper commandBodyWrapper;
    // 节点路径解析器
    private PathParser pathParser;

    public PathParser getPathParser() {
        return pathParser;
    }

    public void setPathParser(PathParser pathParser) {
        this.pathParser = pathParser;
    }

    public CommandBodyWrapper getCommandBodyWrapper() {
        return commandBodyWrapper;
    }

    public void setCommandBodyWrapper(CommandBodyWrapper commandBodyWrapper) {
        this.commandBodyWrapper = commandBodyWrapper;
    }

    public JobNodeConfig getConfig() {
        return config;
    }

    public void setConfig(JobNodeConfig config) {
        this.config = config;
    }

    public NodeManager getNodeManager() {
        return nodeManager;
    }

    public void setNodeManager(NodeManager nodeManager) {
        this.nodeManager = nodeManager;
    }

    public MasterElector getMasterElector() {
        return masterElector;
    }

    public void setMasterElector(MasterElector masterElector) {
        this.masterElector = masterElector;
    }

}