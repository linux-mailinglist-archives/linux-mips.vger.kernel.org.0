Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 062351E9C7A
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jun 2020 06:20:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725765AbgFAEUw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 1 Jun 2020 00:20:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725932AbgFAEUv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 1 Jun 2020 00:20:51 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E381FC08C5CB
        for <linux-mips@vger.kernel.org>; Sun, 31 May 2020 21:20:51 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id b7so407805pju.0
        for <linux-mips@vger.kernel.org>; Sun, 31 May 2020 21:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hMKh+B5RDPq+o7Oive8w/r87Zbfpk7DQQkXRUfW4IOg=;
        b=yEeMkr8V1c7yN+4qOTxaNQ2aaHNewu0hEjwsE4ztlBYLaxeAoUTDgbzHG/eNwqpA/P
         ADC6E0J1xwDpDPCI3hzLDl7hJc3DjP2FcwWAMTtAChrAFq2fzvIp6o2P4yHYNjEucjby
         2aa/lx1bNvFNzOasCR3b6SXbaqGnLqDHgqMDqKGnpAx0iCGMUcM+C54w12zv1ywDzbpB
         ZZGv6z+3pmzCiZplGNcXZZUySenCxB2gXecX/wJxb49TcOM+nyCZJwij1F0qCVM5mb/d
         wYMIC57zxKxJQp58gqL7cVOXdtkGbfVuvswMC8yXpR865usDWXl7UpqwjCLkn1J1mOSh
         PvMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hMKh+B5RDPq+o7Oive8w/r87Zbfpk7DQQkXRUfW4IOg=;
        b=SlbYPbWf7WbohBMPU3yar2LBtZO6e/koUEN2RPnQFDFEXUBnm/RdEZZynUEcnjlFdy
         K2XzSV1EOevm5Ypntrxj9+DECjGGtfIrHfC4SvA8a2UG8f8l/FW/cu5117u6ZQSfcBuC
         HNwyPGL4ermdtWHWVlUTg8/UjBxi+0W1vkOB5gNTKNQSIMcbU6zmMx+MiMwlFai/6xPn
         ekdG67SGxMyDCyVlf4vfA4vf26x7cKz11dfIG3v+k8rJsn5ubqJEgku0yRb16iup4fFJ
         dOWDG6t1ZYaMg+ZBAY0Sx8tds/XDzHR/lIaDWwfOxJaT4fnOlptGyKb82AFafzCv4kvm
         HgKA==
X-Gm-Message-State: AOAM530MOx4X/wIp8kYBqlXqvId4D82szmQVJRvwpy64twJ0QWWiX5IC
        gSnQpPUrmq3rYIfF/zGYaZY5Vg==
X-Google-Smtp-Source: ABdhPJyaIPN0AabB07SDvg8FYmCd2w+PPO/BCoqJqMkvufUjUsRbWQviG1tVmqdXzOsE/DE1c0k1RA==
X-Received: by 2002:a17:90b:888:: with SMTP id bj8mr21322762pjb.148.1590985251318;
        Sun, 31 May 2020 21:20:51 -0700 (PDT)
Received: from localhost ([122.172.62.209])
        by smtp.gmail.com with ESMTPSA id x132sm12983751pfd.214.2020.05.31.21.20.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 31 May 2020 21:20:50 -0700 (PDT)
Date:   Mon, 1 Jun 2020 09:50:48 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Vinod Koul <vkoul@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Arnd Bergmann <arnd@arndb.de>, linux-mips@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 01/11] dt-bindings: dma: dw: Convert DW DMAC to DT
 binding
Message-ID: <20200601042048.hk73khbz4wipevct@vireshk-i7>
References: <20200529144054.4251-1-Sergey.Semin@baikalelectronics.ru>
 <20200529144054.4251-2-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200529144054.4251-2-Sergey.Semin@baikalelectronics.ru>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 29-05-20, 17:40, Serge Semin wrote:
> Modern device tree bindings are supposed to be created as YAML-files
> in accordance with dt-schema. This commit replaces the Synopsis
> Designware DMA controller legacy bare text bindings with YAML file.
> The only required prorties are "compatible", "reg", "#dma-cells" and
> "interrupts", which will be used by the driver to correctly find the
> controller memory region and handle its events. The rest of the properties
> are optional, since in case if either "dma-channels" or "dma-masters" isn't
> specified, the driver will attempt to auto-detect the IP core
> configuration.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Reviewed-by: Rob Herring <robh@kernel.org>

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
