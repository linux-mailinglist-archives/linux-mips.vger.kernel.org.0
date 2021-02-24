Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1747832419F
	for <lists+linux-mips@lfdr.de>; Wed, 24 Feb 2021 17:07:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234766AbhBXQFf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Feb 2021 11:05:35 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:55471 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235321AbhBXPmE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 24 Feb 2021 10:42:04 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 460855C01C1;
        Wed, 24 Feb 2021 10:40:52 -0500 (EST)
Received: from imap1 ([10.202.2.51])
  by compute6.internal (MEProxy); Wed, 24 Feb 2021 10:40:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm1; bh=pAiG3XWYnlEZcI6S9irEA4KEy1T4LoM
        z/fCPiuVlZFk=; b=uOtGb5bfa8FTLQDWaYp6zB5RHIu7jK0IymDRMfatiGQJKWb
        w/WTWHgMDfLcVzJ2ZdqemXUCUvej1kAEXVW4+LzEqoX8snDjOw2pqEb6t0DNKb7l
        qyosZKMx6PLwYyojPBE0h/D7RFUta4k2Hw6oKyqhFHN5nabr28Qr1cOxAgBRM2Q9
        7clKpOmVepl9dnsRCxQPZCznWw2h9Q9sDFtHtYjoEqfDAVeoHLw8lc/68XOFgWz9
        ch2qiWeCSFPVn7q+K8QOhPOXT8N2AjQQ8M856Kg3rmO/j66YURk+9+7Ca8PjMUsv
        pvusF/mDkm+r3YmOI9VBbxHz6o0N4ca+2psHMsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=pAiG3X
        WYnlEZcI6S9irEA4KEy1T4LoMz/fCPiuVlZFk=; b=f9YqKFQEtbpkJNVhS4v+Nt
        MGavQOt+wdXIrLI5V8BXevX6NahE7Dn/Jg701oBFrxKYnVy0VT26/FjATxXoHRXC
        ogNvCDjaJk8Aap7ojfpb85xByR17qKIVhFwaYaHNALIuFFhLFCpXL3IGdRfsdPFh
        hVewIYtaiESmys3Ldmyt0Us1FLLx5tmdeMOMSp7lcv9z+VU/sJLolYITPqZ26Zrq
        PJWKDatxKc5VkNiTft7B2DzJ4TDEjGVhvknviphTuee2e1WOKh3JOh37FjlW+V59
        zFGpK7ylakjFAPI6pXzjMglU1iAhCecustQyTvv9mknjtNJgdyzHMKsh4ROLrYYg
        ==
X-ME-Sender: <xms:gnM2YH1qs7ZiA5hMnVr3w4-FXqktRSFMC8PxvZ1IuKsN9HeiZcSrkw>
    <xme:gnM2YGHBQtVUA82EpxVPDetAzM8vKig2nZS5a-ZlAb7RADpCWEfIi_bTPNaqeMvWN
    gHgb70nvNE-EVlGCcg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrkeejgdejkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedflfhirgig
    uhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepkeelheethfehffdttdelieevfeeiheeuudeifeeugeeuieel
    iedtueejheehhedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:gnM2YH7U9SGJgSeRh-7r8bld1MRKX0V79wlLinTgaKclbtl4iYo-7Q>
    <xmx:gnM2YM0ZoL95rMisBxSc7lTO09eYyZg46i-l6jrsRnaa0FZ9pNmlnQ>
    <xmx:gnM2YKHumDmbLskRFlQV-2Aoss8_TKITM9UQAZLv1ibzbhzKJi_oUA>
    <xmx:hHM2YPTO_KEPcvPfy2jhL8Iho1thdUDgVQCOwHHD1JX7mKwMbKLxZQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 5E8E4130005D; Wed, 24 Feb 2021 10:40:50 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-141-gf094924a34-fm-20210210.001-gf094924a
Mime-Version: 1.0
Message-Id: <987b0dc5-9306-4271-afc0-7c44dba644b7@www.fastmail.com>
In-Reply-To: <1614171720-13221-1-git-send-email-hejinyang@loongson.cn>
References: <1614171720-13221-1-git-send-email-hejinyang@loongson.cn>
Date:   Wed, 24 Feb 2021 23:40:28 +0800
From:   "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To:     "Jinyang He" <hejinyang@loongson.cn>,
        "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
        "John Crispin" <john@phrozen.org>
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] MIPS: Remove detect_memory_region()
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On Wed, Feb 24, 2021, at 9:02 PM, Jinyang He wrote:
> detect_memory_region() was committed by Commit 4d9f77d25268 ("MIPS: add
> detect_memory_region()"). Then it was equipped by Commit dd63b00804a5
> ("MIPS: ralink: make use of the new memory detection code") and
> Commit 9b75733b7b5e ("MIPS: ath79: make use of the new memory detection
> code"). Its code is based on early ath79 platform code.
> 
> What puzzles me is that how memcmp() detect the memory region. If `break`
> was touched, the function could make sense. That means memcmp() should
> return zero. Otherwise, the loop will be end by size > sz_max.
> 
> I have tested detect_memory_region() on Loongson64 3A3000. On our design,
> kseg0 low 256MB maps real memory and kseg0 high 256MB maps IO/PCI. The
> function runs and last stopped on kseg1 where is uncached. In this process
> memcmp also returned non-zero when detected kseg0 high 256MB. Then I did
> another thing. memcpy first and test memcmp then (after &_end). It works
> well on 3A3000 but badly on 3A4000. Maybe because kseg0 high 256MB maps
> IO/PCI and it is dangerous to write like write memory.
> 
> At last, read memory from where is not memory region may always return 0.
> (Or trigger exception.) This function have been used several years and
> seems no error occur. Maybe it's a fallback way.

That is not true for other platforms like ath79 or mtk.
They'll wrap around or return 0xffffffff for out of boundary accessing.

Loongson does not apply to this case as it have special "Address Window"
design to accurately describe address regions.
Any access beyond described windows will be handled by MC and return 0 or random stuff.

Again, please don't make changes because you can.

Thanks.

- Jiaxun
