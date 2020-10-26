Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92A5729959D
	for <lists+linux-mips@lfdr.de>; Mon, 26 Oct 2020 19:45:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1790250AbgJZSpf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 26 Oct 2020 14:45:35 -0400
Received: from mail-ej1-f67.google.com ([209.85.218.67]:35356 "EHLO
        mail-ej1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2443743AbgJZSpf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 26 Oct 2020 14:45:35 -0400
Received: by mail-ej1-f67.google.com with SMTP id p5so15159792ejj.2;
        Mon, 26 Oct 2020 11:45:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gz0y0Kg1cNPHrgAtv63xzsEjT/xY3FlDGvII1tKwfUQ=;
        b=PbdjV1CJtx3TSD04ncdklvDN55aF/mjlpKZQBWu68n6ti+srP5yeznvkkFSkHWWJUm
         QkWMdYBZAR/NAiMerX3RAiIGQddHAjFZu9c//HOymD33CA3yjeTudXeFbzLE8/NBCwuw
         +GRHMswbB+yYAPUH4bv2Cn0WPKjuef8v91/TVYdaKLP6CXGwBd8KJqsYc21QoroOzddO
         cbJsL+Oqnds6mzXtUr9t2A4j5uaYxt7rg5O1fZEgEnPzYJrLcXYlicTkdsZxqP7yQMwO
         mJEbLtZ+sJLpCMNPMTgH0FwtmpClUpPJId1t/0DwGfzXZhcyC1CYf/SgriyYSRjvhGZY
         5WNg==
X-Gm-Message-State: AOAM531+6PWVC7h4JZVNzfxOkb4HeSel+XYcPdEsJCdt2HsEL9wP9EYt
        uNnoDi1EeFsPa/7MrAb3qXY=
X-Google-Smtp-Source: ABdhPJwbHdC4xSeWIGeRgEm2uDYFTmmY8iCHzyomd4336nfeex1zjqBAeuLflDpHoOwgQbTXL2PdDQ==
X-Received: by 2002:a17:906:4803:: with SMTP id w3mr11735021ejq.406.1603737931324;
        Mon, 26 Oct 2020 11:45:31 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
        by smtp.googlemail.com with ESMTPSA id p14sm5615176eds.35.2020.10.26.11.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 11:45:29 -0700 (PDT)
Date:   Mon, 26 Oct 2020 19:45:27 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Alexander Dahl <post@lespocky.de>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Alexander Dahl <ada@thorsis.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        Kukjin Kim <kgene@kernel.org>
Subject: Re: [PATCH v7 07/12] ARM: dts: exynos: Fix schema warnings for
 pwm-leds
Message-ID: <20201026184527.GA165725@kozik-lap>
References: <20201005203451.9985-1-post@lespocky.de>
 <20201005203451.9985-8-post@lespocky.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201005203451.9985-8-post@lespocky.de>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Oct 05, 2020 at 10:34:46PM +0200, Alexander Dahl wrote:
> The node names for devices using the pwm-leds driver follow a certain
> naming scheme (now).  Parent node name is not enforced, but recommended
> by DT project.
> 
>   DTC     arch/arm/boot/dts/exynos5410-odroidxu.dt.yaml
>   CHECK   arch/arm/boot/dts/exynos5410-odroidxu.dt.yaml
> /home/alex/build/linux/arch/arm/boot/dts/exynos5410-odroidxu.dt.yaml: pwmleds: 'blueled', 'greenled' do not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
>         From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml

Please trim the error logs in the future. No need to paste all warnings,
just one or two from the same type of error.  Also your local path
leading to Linux repo should be removed.

Thanks, applied.

Best regards,
Krzysztof

