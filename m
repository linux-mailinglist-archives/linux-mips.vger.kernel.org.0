Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFE7E495C6C
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jan 2022 09:58:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379639AbiAUI6t (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 Jan 2022 03:58:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379624AbiAUI6p (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 21 Jan 2022 03:58:45 -0500
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89366C061401
        for <linux-mips@vger.kernel.org>; Fri, 21 Jan 2022 00:58:45 -0800 (PST)
Received: by mail-yb1-xb2a.google.com with SMTP id v186so25692942ybg.1
        for <linux-mips@vger.kernel.org>; Fri, 21 Jan 2022 00:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5/CAdEqGBk7N/8QQ5A23zI2nrO/utlv2ElHpvb6u4CA=;
        b=REKUOzbTnrnoKH+nWoApUShHgZjf318EWK9itQNe1JkF4qXv+SGJQbIKI+K3H7D+95
         bcr2KPcZ5+mPIb6DxeTuv7HF9kN8W9UUcXvjL4p++kLrmkaD1KNf1eEWqFs7PSKC8dEm
         ME9OL35fUckRg3MVWpk8FylBI+5zGpdZDH3d6rrEzRZCBsJGqGX6DMeqRYiwOOP4Ja/G
         7wGTaZEhKOLsAWLQD4u0b3GOi+vYHxZgMv8Cev8mA3sgaVtzvmxSN8U5g3ueAb/LMM9f
         t55rvr2CTMly8LmNPhlTR+npOVIclcOhEtDaxU0kpotd50fmAekkmRn8B7XG0Wr161Cq
         TIpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5/CAdEqGBk7N/8QQ5A23zI2nrO/utlv2ElHpvb6u4CA=;
        b=CWn5YBqLK6jBnig1/rTGSRJ1/kl4cakj0IeTIswsNOLdpJeQKrtX++tn4vcHEz4GVl
         gdSaHKQzcD1QSVVTz578wvQQ5Ilw2Bvl/BHIoQOoTytWgY1wczX8Tn1lsQuTx5j1KVG7
         4B1Qzsvlg3k60GJJHzPTfSVZbiiDZF9tggg8NEuEsMcrpbTxYVsAZixtTJEzo9jU6ukk
         OMjWkthT7tG4A7DPI4BBXvXETkHipFrFEeKr9oX3+X8REtp1shQvsUhRYw1VbxMOTTfi
         LoyUn979p6eCZ2eTogg6b3xQEKnLrVEoBb6muO/HToqfcygmG8MXddeQrcBPmUIqzJ/I
         E+2w==
X-Gm-Message-State: AOAM531zDnoaU3i6cxPZyXmxnS1YrQFOQgoxiINoogExzxT6jiJcJTyQ
        a2JoYm44gHNMUe56Fck+M3ga0Tg+/8h12/dtnHBlr3YM5X4SXg==
X-Google-Smtp-Source: ABdhPJxGI0tWvbu3C1KPF9nJZim+8Kq1aJ/5f3LrEb7Cs7qRdYvtHbmNg0CYHyFs7ws6XGnbWWn724o1yPYmp+AIMhU=
X-Received: by 2002:a25:9082:: with SMTP id t2mr4422729ybl.684.1642755524616;
 Fri, 21 Jan 2022 00:58:44 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYtq0wzSeG8YG-a+=KrbdWqHJMXk1hvq0FKeAvj9sZAK2g@mail.gmail.com>
 <6249735f-e6b7-1331-eb2b-361bb17d6115@opensource.wdc.com>
In-Reply-To: <6249735f-e6b7-1331-eb2b-361bb17d6115@opensource.wdc.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Fri, 21 Jan 2022 14:28:33 +0530
Message-ID: <CA+G9fYu__OOvk-ESXoOqbd-Lk+CmO8CSQ8chEFf3MyeTjKtp9g@mail.gmail.com>
Subject: Re: [next] mips: cavium_octeon_defconfig: pata_octeon_cf.c:598:23:
 error: passing argument 1 of 'trace_ata_bmdma_stop' from incompatible pointer type
To:     Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc:     "open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" 
        <linux-ide@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-mips@vger.kernel.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        regressions@lists.linux.dev, lkft-triage@lists.linaro.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Zeal Robot <zealci@zte.com.cn>,
        Minghao Chi <chi.minghao@zte.com.cn>,
        CGEL ZTE <cgel.zte@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

> I just posted a fix. As I do not have the environment to compile test
> mips, could someone test please ? I will send the fix to Linus asap
> after confirmation that it is OK.

Please share your patch / patch link. I will test it with tuxmake.

you may also give a try with these easy steps.

# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake
#
# See https://docs.tuxmake.org/ for complete documentation.
# Original tuxmake command with fragments listed below.

 tuxmake --runtime podman --target-arch mips --toolchain gcc-10
--kconfig cavium_octeon_defconfig

- Naresh
