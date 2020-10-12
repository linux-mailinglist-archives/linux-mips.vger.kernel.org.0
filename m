Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5503F28BAE6
	for <lists+linux-mips@lfdr.de>; Mon, 12 Oct 2020 16:33:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388141AbgJLOdW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Oct 2020 10:33:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726963AbgJLOdW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 12 Oct 2020 10:33:22 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6699FC0613D0;
        Mon, 12 Oct 2020 07:33:22 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id m13so15983836otl.9;
        Mon, 12 Oct 2020 07:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=W/NWuxOMj3DYWUWWRbSGfSU8orOwNPFxxNenrYXI1p0=;
        b=oG6lVhGVo/2qVCUPNNIwi7jOPoLnXRocI7681o7HmvzqWOGoaeS9A416hhCr+O1lye
         dFIAgC6q2CYLdAHsEDKQFWywfHRluwbVBALGPMJDZ/Ri7a19DKanV73bWUe6InuaU3WW
         jEel1L9Xbg1IXeaGUiLgfnaPXalripHH02Ot8jx4z6OQ3AwDAt3v0JnFEd6NBKklVXgz
         xI8cU2yKquc3AJLQY5NVzFDCQDSGGeKOBInX54F4E2DDAhAjN7zt6DGaXoRgDNWJDMgH
         ktkcmpIuVVnyxSwXt1ifFCEAIBSG3EKer2uVrRSAENghpapipJN7WVPyTp/Qe2K90fKF
         bvAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=W/NWuxOMj3DYWUWWRbSGfSU8orOwNPFxxNenrYXI1p0=;
        b=iQpEGu8jJi+RekAYjpJMuCaIh1ldn8xY8Tlf8qhkj/pfRWRnLbj6mp69CG2EHIqxFq
         HO397/o0E6gSiSgQ2P8I1tuFm3F8f+2iMlQct5BiAnaf97ewqtMAxFPgN23Vpf1RkW7m
         dkzyJKKi7NCqT1wM7Ln/gAumr3mddX0jDGjwq3TcTZrMFtDJk1ySFh0bESR3kvEqujHK
         2wLcXx+Hae7fQ9ekQhpm/Pei0o9hsAgi+aoW63zmfQlJn1dvV6GMUOl9+7mY/iz610pp
         NGmhAg8YrqnA2U8EbMd6Ei+D/CzhODmn0S6iplVCJk5WtfGDlB1r7QLaOTc5au/lvJ1d
         PIoQ==
X-Gm-Message-State: AOAM530m9QfCqJB40GJfrm8Vt6P0qZNrKsEfgEEDda8UNBDQTgibiutg
        jfV+1E6X7sGn16tOmhKoYL8=
X-Google-Smtp-Source: ABdhPJzcehpYMMx5ZyIZSrSIENA4Ogt7hNH5viPEJ6uKSzHKmY6kP2dpDUUsm0jYif4DiHCnOAoAMw==
X-Received: by 2002:a05:6830:400d:: with SMTP id h13mr19376337ots.371.1602513201290;
        Mon, 12 Oct 2020 07:33:21 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n10sm10452334ooo.23.2020.10.12.07.33.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Oct 2020 07:33:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 12 Oct 2020 07:33:19 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "Maciej W . Rozycki" <macro@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Zhou Yanjie <zhouyanjie@wanyeetech.com>, od@zcrc.me,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v3 11/15] MIPS: generic: Add support for Ingenic SoCs
Message-ID: <20201012143319.GA24291@roeck-us.net>
References: <20200906192935.107086-1-paul@crapouillou.net>
 <20200906192935.107086-12-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200906192935.107086-12-paul@crapouillou.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Sep 06, 2020 at 09:29:31PM +0200, Paul Cercueil wrote:
> Add support for Ingenic SoCs in arch/mips/generic/.
> 
> The Kconfig changes are here to ensure that it is possible to compile
> either a generic kernel that supports Ingenic SoCs, or a Ingenic-only
> kernel, both using the same code base, to avoid duplicated code.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

This patch results in the following build error (mips:allmodconfig).

In file included from <command-line>:
arch/mips/mm/init.c: In function 'mem_init':
include/linux/compiler_types.h:319:38: error: call to '__compiletime_assert_331'
	declared with attribute error: BUILD_BUG_ON failed:
		IS_ENABLED(CONFIG_32BIT) && (_PFN_SHIFT > PAGE_SHIFT)

Bisect log attached.

Guenter

---
# bad: [d67bc7812221606e1886620a357b13f906814af7] Add linux-next specific files for 20201009
# good: [549738f15da0e5a00275977623be199fbbf7df50] Linux 5.9-rc8
git bisect start 'HEAD' 'v5.9-rc8'
# bad: [b71be15b496cc71a3434a198fc1a1b9e08af6c57] Merge remote-tracking branch 'bpf-next/master' into master
git bisect bad b71be15b496cc71a3434a198fc1a1b9e08af6c57
# bad: [6be11f939f380ef14bc94242cb0262197ce2a054] Merge remote-tracking branch 'i2c/i2c/for-next' into master
git bisect bad 6be11f939f380ef14bc94242cb0262197ce2a054
# good: [c03a115d8ad8a87b6d275c3c91c13bc111217bf6] Merge remote-tracking branch 'samsung-krzk/for-next' into master
git bisect good c03a115d8ad8a87b6d275c3c91c13bc111217bf6
# bad: [bdd0ef71b0d7d6a8f1d59af57dc73d19ddc26ad0] Merge remote-tracking branch 'f2fs/dev' into master
git bisect bad bdd0ef71b0d7d6a8f1d59af57dc73d19ddc26ad0
# bad: [0c4bd40a7ccd06122c1942f525b714abcd9efe36] Merge remote-tracking branch 'powerpc/next' into master
git bisect bad 0c4bd40a7ccd06122c1942f525b714abcd9efe36
# bad: [744d2c114d58c11fd76d572021d7ef3c55a1a225] Merge remote-tracking branch 'nds32/next' into master
git bisect bad 744d2c114d58c11fd76d572021d7ef3c55a1a225
# good: [1e9f9330cea616f9f2baf8144f049e4b405715dd] Merge remote-tracking branch 'csky/linux-next' into master
git bisect good 1e9f9330cea616f9f2baf8144f049e4b405715dd
# bad: [b350041e6f23a71f63f1eee6d939c846838e7e25] MIPS: alchemy: remove unused ALCHEMY_GPIOINT_AU1000
git bisect bad b350041e6f23a71f63f1eee6d939c846838e7e25
# good: [43df4eb2fc9511e09c66252c3fec4f8933a77c73] MIPS: Replace SIBYTE_1956_WAR by CONFIG_SB1_PASS_2_WORKAROUNDS
git bisect good 43df4eb2fc9511e09c66252c3fec4f8933a77c73
# good: [13a0ea28e8c698cc0d600fdeed8da3e4d478b97e] MIPS: generic: Init command line with fw_init_cmdline()
git bisect good 13a0ea28e8c698cc0d600fdeed8da3e4d478b97e
# bad: [d41afc398fbc9dfb8c40b951e97a7f0283346c6a] MAINTAINERS: Update paths to Ingenic platform code
git bisect bad d41afc398fbc9dfb8c40b951e97a7f0283346c6a
# bad: [f0f4a753079c636d5d43a102edbde0dad1e7de51] MIPS: generic: Add support for Ingenic SoCs
git bisect bad f0f4a753079c636d5d43a102edbde0dad1e7de51
# good: [c3e2ee657418f4f2bff1269c0550f8135ed0c927] MIPS: generic: Add support for zboot
git bisect good c3e2ee657418f4f2bff1269c0550f8135ed0c927
# good: [02bd530f888c6d6ba4995c3afcd10f87c136f173] MIPS: generic: Increase NR_IRQS to 256
git bisect good 02bd530f888c6d6ba4995c3afcd10f87c136f173
# first bad commit: [f0f4a753079c636d5d43a102edbde0dad1e7de51] MIPS: generic: Add support for Ingenic SoCs
