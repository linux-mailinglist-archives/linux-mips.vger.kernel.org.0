Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A749D2F8F47
	for <lists+linux-mips@lfdr.de>; Sat, 16 Jan 2021 21:46:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726619AbhAPUqJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 16 Jan 2021 15:46:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726385AbhAPUqI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 16 Jan 2021 15:46:08 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 655BBC061573;
        Sat, 16 Jan 2021 12:45:27 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id i63so10270202wma.4;
        Sat, 16 Jan 2021 12:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1bOdjlQaGWQ8aWyfQJKQhH8VYqrUnQwXrgWi9Mree3I=;
        b=JVLUSXN/s1nK2Icd010Ugl0WvUG8e2CogSLbdUBFSOCqzl8Viq35eqiCorrawBbqOP
         lZdjcJr04Wpdfl0I5R5AF5jAS0inbViR+2YrmTTSNV4t668qWTILE5++Nf1XvS2wOCYD
         LySvYMj2/eickyHPLaVIuS1zfuAn76npFktWUqmNc42VN2bJTPQJC1+B/Mb9IVS8wEoz
         dqC3FavixxVSFWz1Xc2lbDjdUeBAdmxZX+s+g/mVTNC+9PA3UWodxnfHwcdlFA1zlP11
         ujZM1QALLVQrEHB2Ire3ONAEyvBYfEeXY0Ulr28zoRfDDobOQ91WYmA/qf8c/Cgiavaq
         dkAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1bOdjlQaGWQ8aWyfQJKQhH8VYqrUnQwXrgWi9Mree3I=;
        b=cJPexEoi3sbWyFkRztO0P0e9otZK5CN/n7L1iS/YLT1jr9JiUr/NXo+ry6ZEwQE4dd
         bW0eBXD62j8hHbPtB7wFLNbkTTt7jzy7prCcQoDv5hK2UUT+r1n/3yIXQhHegWMVU0gJ
         W+bdw+2QLwz2ZVCJq/vfss0vPtb24lV+OHTXoWrC4PdmcVW880jMB2itPGaycfPxCeL4
         MZfFwiBMarejerkLmUIhKggEp+gYQkRFST1RlSxS6X74P6bTgENOuyCtWWszVHKn+WCq
         c/r/eEj2xpAXsa7mOOlZgwp3BVlf/yS45MC+pEu4Kg1u3LaUpI9xbqDoLaUstHEw35fr
         rjTA==
X-Gm-Message-State: AOAM532tPU4DeIFT7wGnDUO8SSbNg+Rvb29O7lF2GY2cx4xjGZ94bQxt
        CiTR+gWMtdt6QDWxbEXPjsE=
X-Google-Smtp-Source: ABdhPJwElVqFppdHo/z59LybTiKhI0iTID9QTEnWtvUWk4UygqYhNQIsB8EmTnF1JLq5RzR48DOtPw==
X-Received: by 2002:a05:600c:2255:: with SMTP id a21mr14522086wmm.122.1610829925978;
        Sat, 16 Jan 2021 12:45:25 -0800 (PST)
Received: from localhost.localdomain (p200300f13723cb00428d5cfffeb99db8.dip0.t-ipconnect.de. [2003:f1:3723:cb00:428d:5cff:feb9:9db8])
        by smtp.googlemail.com with ESMTPSA id c2sm15180609wrt.87.2021.01.16.12.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jan 2021 12:45:25 -0800 (PST)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     olek2@wp.pl
Cc:     devicetree@vger.kernel.org, john@phrozen.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        robh+dt@kernel.org, tsbogend@alpha.franken.de
Subject: RE: [PATCH] dt-bindings: mips: lantiq: Document Lantiq Xway DMA bindings
Date:   Sat, 16 Jan 2021 21:45:21 +0100
Message-Id: <20210116204521.150091-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210103101803.2123-1-olek2@wp.pl>
References: <20210103101803.2123-1-olek2@wp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

(another late reply from me, sorry)

> +required:
> +  - compatible
> +  - reg
This is actually an older IP variant of what can be found in the Intel
LGM SoCs. The dt-bindings are currently being upstreamed for that newer
SoC in [0].

Based on "DOs and DON’Ts for designing and writing Devicetree bindings"
I think some more mandatory properties are needed, even though our
driver currently uses none of them:
- interrupts: as far as I know the IP on the Lantiq SoCs has (at least)
  one interrupt for each DMA channel. That means: 28 interrupts on the
  xRX200 SoCs
- I *assume* (but I have not researched if that's really the case) that
  the Lantiq variant also has at least one clock input and a reset line
- since we don't have a proper DMA driver yet I can't comment what we
  should use for #dma-cells

> +examples:
> +  - |
> +    dma@e104100 {
note to self: it seems that both dma@ and dma-controller@ are used in
existing schemas (the latter having twice as many occurrences though):
$ grep -R dma@ Documentation/devicetree/bindings/dma/* | wc -l
20
$ grep -R dma-controller@ Documentation/devicetree/bindings/dma/* | wc -l
45


Best regards,
Martin


[0] https://patchwork.ozlabs.org/project/devicetree-bindings/patch/0864b9bfa6e2b8b5e7ad9a7a739ca3274f66493c.1610703653.git.mallikarjunax.reddy@linux.intel.com/
[1] https://www.kernel.org/doc/html/latest/devicetree/bindings/writing-bindings.html
