Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8019512D1A0
	for <lists+linux-mips@lfdr.de>; Mon, 30 Dec 2019 16:58:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727604AbfL3P6b (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Dec 2019 10:58:31 -0500
Received: from frisell.zx2c4.com ([192.95.5.64]:35709 "EHLO frisell.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727565AbfL3P6b (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Dec 2019 10:58:31 -0500
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 32ec708b;
        Mon, 30 Dec 2019 15:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
        :references:in-reply-to:from:date:message-id:subject:to:cc
        :content-type; s=mail; bh=sfGSg1ph2K9yCG/ddlHTxH291Oc=; b=KtCHhD
        GDRYs8AgWk7Gcyc4QT476Y3pSHGgVTKVGoloLFJDicO/xbVQpkTcE94ZJuPD9FWL
        C4u1S+5j0j8pdp2GPHpMt1noUG0ZtKD3vXJkp+5M73+G2YvuBAJXOtlpqEe7zrpk
        FuGIrEhVlEziz2ozhpN4nQJIg08OJt0sUQ68UNbxlDYGdEeUeTE5HNoAMfZb83Lg
        tL1EmQZqq0PAecqjPPVRpLMAz/G5fPE5nhjN9oZvu3bXs30cm/yijljqe6zSL6Ln
        s+cxuVp/ToYFlZRadEONtYpMP8ZiQZ9eLcnSNjArkVCjlvXB9br7ySY7TtSsX62j
        DPZ4KVmY/7GHM/qA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ef9ae089 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO);
        Mon, 30 Dec 2019 15:00:22 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id c16so11083508oic.3;
        Mon, 30 Dec 2019 07:58:29 -0800 (PST)
X-Gm-Message-State: APjAAAVHfm9qMUvkXhmSHh67SaFbd2XADml3iWa2rU+UNMmDvqDcTqfT
        W4BNVCVm+lGQCrL8p8LvzPuFWrM0wpdv7RhMmzY=
X-Google-Smtp-Source: APXvYqx2Bgs+rMfJMj1kBfGo509i02hB+VENci6B2mCd7te+hTiAzBTfmOh5qSER2YqiLKf0XG8qj2PMjO90ib4sFHQ=
X-Received: by 2002:aca:815:: with SMTP id 21mr5726820oii.52.1577721508987;
 Mon, 30 Dec 2019 07:58:28 -0800 (PST)
MIME-Version: 1.0
References: <20191223130834.GA102399@zx2c4.com> <20191224135404.389039-1-Jason@zx2c4.com>
 <CAK8P3a1fVFDkHe=gLy55rHxwfZ8YKcUSYvnhSoMbcAgWy6Nm9w@mail.gmail.com>
 <CAHmME9o07dQV_MmWmtBFCKp=sdsO-scC6-UbXNi=dpU6umCoPg@mail.gmail.com>
 <CAK8P3a0sWObusG3xO_JE9CXCyNfFN0p6OgPjUyU2CHLBBZNpZw@mail.gmail.com>
 <CAHmME9o==nBONywVgSjsmjs2H_A8itgmwibqzPmvivcSocKWRQ@mail.gmail.com>
 <CAK8P3a11g-UXcYdudDtp0TWCQAfotpc-63BqYwn-a9LDxV-b+Q@mail.gmail.com>
 <CAHmME9pnBtjJ86gsWgK8DCYKo_HFpyViHoGpJPTrYBONT01YVA@mail.gmail.com> <CAK8P3a0NBuqDX63+920q7Q+yO2xCoSd0O7xUDJv6BBoco2kVOg@mail.gmail.com>
In-Reply-To: <CAK8P3a0NBuqDX63+920q7Q+yO2xCoSd0O7xUDJv6BBoco2kVOg@mail.gmail.com>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Mon, 30 Dec 2019 16:58:17 +0100
X-Gmail-Original-Message-ID: <CAHmME9rnnoFwh=EHAgdQFM+c33D9mgCoVML_+d=Js=pXPnsxKQ@mail.gmail.com>
Message-ID: <CAHmME9rnnoFwh=EHAgdQFM+c33D9mgCoVML_+d=Js=pXPnsxKQ@mail.gmail.com>
Subject: Re: [PATCH] mips: vdso: conditionalize 32-bit time functions on COMPAT_32BIT_TIME
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Christian Brauner <christian.brauner@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Makes sense w.r.t. time32 situation.

I still think that in spite of that there's still something weird
happening with the mips VDSO.

Here's a register dump before the call:

 $ 0   : 0000000000000000 0000000000000001 0000000010000000 fffffffffffffffc
 $ 4   : 0000000000000002 000000007fff2e40 0000000000000000 0000000000000001
 $ 8   : 0000000000000000 0000000000000000 0000000000000000 0000000000000000
 $12   : 0000000000000000 000000000000000a ffffffff80000000 000000007fffffda
 $16   : 0000000010001ba8 0000005800000015 0000000010000000 0000000010000000
 $20   : 0000000010000000 0000000010000000 0000000000000000 0000000077ff2ae8
 $24   : 0000000000000005 0000000077fa1d18
 $28   : 0000000010019cf0 000000007fff2e40 0000000000000000 0000000010000c30
 Hi    : 0000000000000000
 Lo    : 0000000000000000
 epc   : 0000000077fa1d18 0x77fa1d18
 ra    : 0000000010000c30 0x10000c30

And here it is immediately after:

 $ 0   : 0000000000000000 0000000000000001 ffffffffffffffa7 000000007fff5000
 $ 4   : 0000000000000002 000000007fff2e40 0000000077ff2000 0000000000000001
 $ 8   : 0000000000000006 0000000000000020 0000000000000002 0000000000000000
 $12   : 0000000000000000 0000000000001852 ffffffff80156160 000000007fffffda
 $16   : 0000000010001ba8 0000005800000015 0000000010000000 0000000010000000
 $20   : 0000000010000000 0000000010000000 0000000000000000 0000000077ff2b00
 $24   : 0000000000000005 0000000000000000
 $28   : 000000007fff5000 000000007fff2e30 0000000000000000 0000000077fa1e00
 Hi    : 0000000000000000
 Lo    : 0000000000000000
 epc   : 0000000077fa1e00 0x77fa1e00
 ra    : 0000000077fa1e00 0x77fa1e00

I wonder if a toolchain option or compiler bug or something is causing
the vdso to not restore certain registers (gp? ra?).
