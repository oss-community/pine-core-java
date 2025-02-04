open module core.java.datamodel {
    requires com.fasterxml.jackson.databind;
    requires io.vavr;
    requires java.desktop;
    requires javaee.web.api;

    exports com.pineframework.core.datamodel.enums;
    exports com.pineframework.core.datamodel.exception;
    exports com.pineframework.core.datamodel.filter;
    exports com.pineframework.core.datamodel.model;
    exports com.pineframework.core.datamodel.paging;
    exports com.pineframework.core.datamodel.persistence;
    exports com.pineframework.core.datamodel.select;
    exports com.pineframework.core.datamodel.serializing;
    exports com.pineframework.core.datamodel.sort;
    exports com.pineframework.core.datamodel.utils;
    exports com.pineframework.core.datamodel.validation;
}