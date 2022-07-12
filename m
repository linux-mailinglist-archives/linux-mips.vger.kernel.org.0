Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FD1057261C
	for <lists+linux-mips@lfdr.de>; Tue, 12 Jul 2022 21:42:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234551AbiGLTmF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 12 Jul 2022 15:42:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233781AbiGLTlk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 12 Jul 2022 15:41:40 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10009B96AE
        for <linux-mips@vger.kernel.org>; Tue, 12 Jul 2022 12:19:17 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id p6so8213248ljc.8
        for <linux-mips@vger.kernel.org>; Tue, 12 Jul 2022 12:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sudomaker-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:from
         :subject:content-transfer-encoding;
        bh=rAw2fbAjZCbgFWVk42JEvLOJIV05KOpAjPWfL9HC23U=;
        b=FMO2tingnx4hgnSCFlgQyoTAafxs0BkqnSSOgEdUPIduw+TKZ0Ggm2F8jCw972EPSW
         xE8ExGSLB9celVi8nakXRpkmkkMbMuQAwbpNHHwmoK7oI4SFgwDZWmLsulYS2C8oyJ/d
         tNBlMH8jKSsnnREYZfIsrSsI2b7lQvyrvuxF0KMhSoV3zsB305hY9eseIDPBaR8/tHUj
         BS2h0rYwIhDtKrNP3SXSm69kuXTFaOcVfyN8F4QFproM8x4MuPfOKCkaEMqL85HkP+QO
         ESwJufd57A8LfYvCBILTCDV0wpg+Y4nG1ihQDYMPIM0vCzsl356AKZ6mWlgSQzaq31OM
         RXXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:from:subject:content-transfer-encoding;
        bh=rAw2fbAjZCbgFWVk42JEvLOJIV05KOpAjPWfL9HC23U=;
        b=x8Qgn/TO7d8yA5xIJjRLhV0QFyNCUj62Oq4fblEWwruNq6NXh4EiUkU6yEFN93BUH3
         5YrmYE8YInaIu21GqXXvCjcrQX/XpYi7CoYBMxWp4qiblLxan7cVIzMVa2EdwBb36nke
         n/WkWZW0wf5+zPqDQJSXPGnlEUMkzH7sPhJumVD3xJNW79XBBUPZcQXQYc3AJpMFYQw4
         OTfmod5NgBebDDbJlho6oK6HDcw6pneosWADX7RalT0TJz0Onab8makZjeJydyN94y5K
         ShIlcDjM+bt0wTWH+bO7Kk+ekgqVzUN4mKYgeHuXzQoRlNj/TqSrvY12Qq/MONwwocAq
         lFxQ==
X-Gm-Message-State: AJIora98GfAxPyiPcCGs/OswbmyjB2nS3b72fFfDzYHciKpYfjFVBPLW
        GhOxPFNFrICdhcJVS6XnykV9cZnIAXG9jjJb
X-Google-Smtp-Source: AGRyM1uQEtbrjesRMa9o76e+hNddul/1mStQTJjV4vmRpZ9SjEExZteIv+LAQomxQheRBJTCbINNsA==
X-Received: by 2002:a2e:908e:0:b0:25d:53c2:5395 with SMTP id l14-20020a2e908e000000b0025d53c25395mr13684130ljg.120.1657653555061;
        Tue, 12 Jul 2022 12:19:15 -0700 (PDT)
Received: from [172.16.24.11] ([185.230.126.10])
        by smtp.gmail.com with ESMTPSA id q5-20020a056512210500b00489ed49d243sm673397lfr.260.2022.07.12.12.19.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 12:19:14 -0700 (PDT)
Message-ID: <e58406ce-a79b-fe91-9587-09e87953d0ab@sudomaker.com>
Date:   Wed, 13 Jul 2022 03:19:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To:     linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
        Zhou Yanjie <zhouyanjie@wanyeetech.com>,
        aidanmacdonald.0x0@gmail.com
From:   Mike Yang <reimu@sudomaker.com>
Subject: RFC: Proper suspend-to-ram implementation of Ingenic SoCs
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The suspend-to-ram implementation of Ingenic SoCs in the current kernel i=
s nowhere near usable, especially for the X series SoCs. Since it involve=
s turning off CPU core power and putting DRAM into self-refresh mode, thi=
ngs are a bit complicated. Turning off CPU core power means all register =
files and cache contents are lost. Putting DRAM into self-refresh mode me=
ans it will no longer respond to bus transactions.

I ported the implementation from Ingenic's 3.10 kernel to 5.18, and it wo=
rked. But it involves a separate piece of executable code, and apparently=
 there's no way to eliminate it. During pm_enter(), various CPM registers=
 are configured to turn off CPU core and put DRAM into self-refresh upon =
issuing the "wait" instruction, this piece of executable code will be cop=
ied to the on-chip SRAM, and its entry address will be written into the C=
PM.SLPC register. Then, cache will be flushed and CPU register files (inc=
l. CP0, CP1 stuff) will also be saved in the SRAM. Finally, the "wait" in=
struction will be issued, and the suspend procedure completed. When any e=
xternal events trigger a resume, the CPU is powered on, and immediately j=
umps to the PC stored in CPM.SLPC, and starts executing the piece of code=
=2E The code will perform the usual crt0 stuff on MIPS machines, reconfig=
ure the DRAM into normal mode, and finally restore the register files. Th=
en the control flow goes back to pm_enter(), and the resume procedure is =
completed.

The suspend-to-ram really saves a lot of power. For my particular board, =
the idle power consumption is about 0.24W (1.25V Vcore, 1.2GHz, 1000Hz, p=
reempt). After suspend-to-ram, it drops to only 0.045W.

So here are my questions:
1. I don't see a way to eliminate the piece of executable code in SRAM. I=
s there any other ways?
2. If we can't eliminate the code in SRAM, what's the accepted way of int=
egrating it into the kernel tree?
3. If the hardware doesn't have 32k crystal connected, or the RTC is stri=
pped off (e.g. X1501), some CPM registers need to be configured different=
ly. How could we provide this configuration?


Regards,
Mike
