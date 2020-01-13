Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B67921399D7
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jan 2020 20:11:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729293AbgAMTKu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Jan 2020 14:10:50 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:33576 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729288AbgAMTKt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 13 Jan 2020 14:10:49 -0500
Received: by mail-pg1-f196.google.com with SMTP id 6so5168586pgk.0;
        Mon, 13 Jan 2020 11:10:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:cc:cc:subject
         :references:in-reply-to;
        bh=TKkoejQV2c6zTi0Lk84zRP/sLh+dHPb6nJ3LQs91rO0=;
        b=XQ5xJi8Gx6ysA2olw0EfSqn/dUSmhoexAm31/j56/8sFKStEsg95i3Q9lgqXqW3CHu
         Jm5hxz8p/slk5A4JdIIICmFq7chJzuyXXALzxOWyFWwg5YLbE5oZe/b9HtnFz0nCbt9w
         o46QjuWk/dJXDBtOygWVsNGNsIFsQyK9ZVI//kv3+/SIwK0uP8BUR9UHOfOtZdsA6bf+
         bC7JRLvroUhQXmGHBkKmzeOJofzXr4k0KjNgoizaKJsaV9SmnVy78OzvTIpZFAWIV6Ob
         RxHUH1YIZk0nXVgkMT93+Gps8r4HKfQoGrYMWcuu0WXPKJO/WW27L8VDDU1IGxdu0I8R
         nnRA==
X-Gm-Message-State: APjAAAV1EviHH5S1UnxywmvanpiAkA02FSNYbsyYn3agCIzd6wh8RzAo
        6xK/rAxUkaZ4bNG2JZ6LXTo=
X-Google-Smtp-Source: APXvYqxpcMDnuAK6LNWLusoFsllAJWymSw/KyOmcfqBZ+FKSDh+VYiY8UaD3R5kny7v3CzIXMzUf6w==
X-Received: by 2002:a63:6b07:: with SMTP id g7mr21929891pgc.243.1578942648698;
        Mon, 13 Jan 2020 11:10:48 -0800 (PST)
Received: from localhost (MIPS-TECHNO.ear1.SanJose1.Level3.net. [4.15.122.74])
        by smtp.gmail.com with ESMTPSA id y6sm14563154pgc.10.2020.01.13.11.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 11:10:47 -0800 (PST)
Message-ID: <5e1cc0b7.1c69fb81.c151b.187c@mx.google.com>
Date:   Mon, 13 Jan 2020 11:10:47 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     Yangtao Li <tiny.windzz@gmail.com>
CC:     khilman@baylibre.com, leoyang.li@nxp.com, khalasa@piap.pl,
        john@phrozen.org, matthias.bgg@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org, kgene@kernel.org, krzk@kernel.org,
        mripard@kernel.org, wens@csie.org, ssantosh@kernel.org,
        jun.nie@linaro.org, shawnguo@kernel.org
CC:     linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        Yangtao Li <tiny.windzz@gmail.com>
CC:     linux-mips@vger.kernel.org
Subject: Re: [PATCH 08/10] soc: lantiq: convert to devm_platform_ioremap_resource
References:  <20191214175447.25482-8-tiny.windzz@gmail.com>
In-Reply-To:  <20191214175447.25482-8-tiny.windzz@gmail.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Yangtao Li wrote:
> Use devm_platform_ioremap_resource() to simplify code.

Applied to mips-next.

> commit 23c25c732530
> https://git.kernel.org/mips/c/23c25c732530
> 
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> Signed-off-by: Paul Burton <paulburton@kernel.org>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paulburton@kernel.org to report it. ]
