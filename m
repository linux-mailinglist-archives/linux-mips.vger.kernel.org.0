Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 561692EC3F0
	for <lists+linux-mips@lfdr.de>; Wed,  6 Jan 2021 20:33:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726698AbhAFTcf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 6 Jan 2021 14:32:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726687AbhAFTcf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 6 Jan 2021 14:32:35 -0500
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [IPv6:2001:67c:2050::465:202])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33040C061575
        for <linux-mips@vger.kernel.org>; Wed,  6 Jan 2021 11:31:55 -0800 (PST)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4D9zxn2tPlzQlVB;
        Wed,  6 Jan 2021 20:31:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hauke-m.de; s=MBO0001;
        t=1609961483;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=g8UBgHVCXyARAjVjDj7JTSFnrZsIy/TpEWnf18DS+lY=;
        b=ivgpOCmeLVIa1NL0PBu/ICJ3YFe0tJJkYYs8LAA1xjSH7/9KcWLopzR5FNkBexLWqT4XZq
        8gOoWCdgxnAj+oFGewz/uZKH/HDTX3MmAaw4/kKBSxLhp44+JrrW9NhOhm6ITRSJqvVLEn
        9hVXd7+sv3HNKYzsd56C6dwB20GN/1S+Wb1h39DRCO/kaFXuz8pygBArTzZwVOmzzHSgj3
        kxCf7E0ibmYNCduzpzs8VqQ2vq+a4jEHM+JkbHZFDVLOJdiS6h/FXts0xGjG2ax2wN1KD8
        +PrrYkL1p1IqMQMpPukHzVyti9zQ4zFtqthdgNHKXdJoJS3AlIjrUk1j8p2eig==
Received: from smtp1.mailbox.org ([80.241.60.240])
        by spamfilter06.heinlein-hosting.de (spamfilter06.heinlein-hosting.de [80.241.56.125]) (amavisd-new, port 10030)
        with ESMTP id Ye-c6ipMHu9O; Wed,  6 Jan 2021 20:31:22 +0100 (CET)
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
References: <20200227144910.GA25011@alpha.franken.de>
From:   Hauke Mehrtens <hauke@hauke-m.de>
Subject: Re: MIPS Hardware support
Message-ID: <6a57f435-3b55-d9b5-e0ab-abdb13c01f96@hauke-m.de>
Date:   Wed, 6 Jan 2021 20:31:21 +0100
MIME-Version: 1.0
In-Reply-To: <20200227144910.GA25011@alpha.franken.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -3.81 / 15.00 / 15.00
X-Rspamd-Queue-Id: 717AE184F
X-Rspamd-UID: ebc6d9
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2/27/20 3:49 PM, Thomas Bogendoerfer wrote:
> Hi,
> 
> we have 47 MIPS system types and I'd like to get an overview how alive
> they really are. I've already grouped the 47 systems a little bit by
> hardware I already own and regulary test kernels. Could you please
> give me some feedback about the "unclassified" systems ? What systems
> are supported by qemu (real test not just repeating qemu docs) ?
> Thank you for your help.
> 

> Atheros AR71XX/AR724X/AR913X based boards (ATH79)

ath79 is well supported in OpenWrt, you can get devices in normal stores.

> Broadcom BCM47XX based boards (BCM47XX)

BRCM47xx is supported in OpenWrt, you can get devices on ebay.

> IMG Pistachio SoC based boards (MACH_PISTACHIO)

I have an IMG Marduk (Creator Ci40) which uses MACH_PISTACHIO.
This is also supported in upstream OpenWrt, but it does not have many 
users.

Hauke
