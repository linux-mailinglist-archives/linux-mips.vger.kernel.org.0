Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CECE1D894A
	for <lists+linux-mips@lfdr.de>; Mon, 18 May 2020 22:37:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726721AbgERUew (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 18 May 2020 16:34:52 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:35910 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726367AbgERUew (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 18 May 2020 16:34:52 -0400
Received: by mail-io1-f67.google.com with SMTP id k6so12201697iob.3;
        Mon, 18 May 2020 13:34:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=FPMBwfiZVk3j4Ctqnv2H9eGRXj7eNBfK/u6YKzz2+rM=;
        b=JDj+W0mErdE2JQeolvKrKmQqHPG50OfY7u+9jdrW9MZf5JpO849iCmz0GVUpxsB9xx
         VxHIKX0shWIfWx06Iw1JxboLoB/Nya4+GqaiOUqKsBOoCqx3YWtyCGEwQjZtNOGeyUwq
         9pSLsdAZ/xQVS/D9W2XgeitLjCPhPi9PdpDoGAuCFgsiDQPKTIMcX1kqXYKe5dm3NNQl
         0vT5vJoxmK8jNb1QaRgB54E0qqTIvjOnTXu6VFjPhwGW2KCPIDS25n3pI1AtJo7iDQc+
         M7kUhQNOgzDIMqqAalgY5GzlgHEZ2V0+Ez/7YDtR+7nX6yN8AsOdDz/eO9SyLIZB0ojS
         maRw==
X-Gm-Message-State: AOAM532Hc5/xAsf5ZNOit3shQQjOntDO8Y+BAL78CfrKqUlYJxtdlv2m
        yMJswSqkdMyXRxNNbFi5gw==
X-Google-Smtp-Source: ABdhPJxPAQ/6uPUZ1zru5yJ1OYVX0KAbu5hmv/CV4Yru4mW2940N2L7A/OQbxrTC3KlWuB7X6GzEYg==
X-Received: by 2002:a6b:d219:: with SMTP id q25mr14825078iob.202.1589834091409;
        Mon, 18 May 2020 13:34:51 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id i78sm5194353ile.87.2020.05.18.13.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 13:34:50 -0700 (PDT)
Received: (nullmailer pid 1050 invoked by uid 1000);
        Mon, 18 May 2020 20:34:49 -0000
Date:   Mon, 18 May 2020 14:34:49 -0600
From:   Rob Herring <robh@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Paul Burton <paulburton@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Maxim Kaurkin <maxim.kaurkin@baikalelectronics.ru>,
        linux-hwmon@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
        linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        linux-mips@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add Baikal-T1 PVT sensor
 binding
Message-ID: <20200518203449.GA989@bogus>
References: <20200306132611.103408030701@mail.baikalelectronics.ru>
 <20200510103211.27905-1-Sergey.Semin@baikalelectronics.ru>
 <20200510103211.27905-2-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200510103211.27905-2-Sergey.Semin@baikalelectronics.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, 10 May 2020 13:32:10 +0300, Serge Semin wrote:
> Baikal-T1 SoC is equipped with an embedded process, voltage and
> temperature sensor to monitor the chip internal environment like
> temperature, supply voltage and transistors performance.
> 
> This bindings describes the external Baikal-T1 PVT control interfaces
> like MMIO registers space, interrupt request number and clocks source.
> These are then used by the corresponding hwmon device driver to
> implement the sysfs files-based access to the sensors functionality.
> 
> Co-developed-by: Maxim Kaurkin <maxim.kaurkin@baikalelectronics.ru>
> Signed-off-by: Maxim Kaurkin <maxim.kaurkin@baikalelectronics.ru>
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-mips@vger.kernel.org
> 
> ---
> 
> Changelog v2:
> - Lowercase the node-name in the example.
> - Add dual-license header.
> - Don't use a multi-arg clock phandle reference in the examples dt-binding
>   property. Thus reundant include pre-processor statement can be removed.
> - Replace "additionalProperties: false" property with
>   "unevaluatedProperties: false".
> - Discard label definition from the example.
> - Align settings of the "#thermal-sensor-cells" property with two spaces
>   ahead of the property line start.
> ---
>  .../bindings/hwmon/baikal,bt1-pvt.yaml        | 95 +++++++++++++++++++
>  1 file changed, 95 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/baikal,bt1-pvt.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
