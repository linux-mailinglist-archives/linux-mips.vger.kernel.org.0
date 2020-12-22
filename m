Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E1CD2E0BFC
	for <lists+linux-mips@lfdr.de>; Tue, 22 Dec 2020 15:47:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727019AbgLVOrT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 22 Dec 2020 09:47:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726949AbgLVOrT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 22 Dec 2020 09:47:19 -0500
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [IPv6:2001:67c:2050::465:101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E81A8C0613D3
        for <linux-mips@vger.kernel.org>; Tue, 22 Dec 2020 06:46:38 -0800 (PST)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:105:465:1:2:0])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4D0fL36W0hzQl1t;
        Tue, 22 Dec 2020 15:46:35 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hauke-m.de; s=MBO0001;
        t=1608648393;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EJeauVdSe2HUDrIDQ6WHqqGX3q1vqxpDnz5rect4fMY=;
        b=Xe9vNn6sKjswRrAcl1YwE+CDfr+SclrR9Q2Xr9MXZ7MHLOftpzOJTzfA3L15uptdipQWwo
        dTVT2kG28tH7h7afEKkhvv+srrvOQyCAURniwd9Fyti6ubLqROTrBvjO72Y8zl7DA0XXoY
        ikzS4fwOltBMVTGSDy8jZsj8lpMZnZGq4G1imMk7bNlmH+uT7TDEuze7i+38ha1e3UVhCf
        AbmODSROq2TFKmTeDd9/1Cn2s/LiWFVIJrjSDTkvg9OD3xmvKlWJlu56iEwilts9lfeN/U
        9tg04bwHZVWS6XhCwx00F9wZzlMcGcp2jhe9T3huLx950WU89HUU84k303/KFw==
Received: from smtp2.mailbox.org ([80.241.60.241])
        by spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de [80.241.56.122]) (amavisd-new, port 10030)
        with ESMTP id UHaOaewiV849; Tue, 22 Dec 2020 15:46:32 +0100 (CET)
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
References: <20201220193201.GA3184@alpha.franken.de>
From:   Hauke Mehrtens <hauke@hauke-m.de>
Subject: Re: CPUs with EVA support
Message-ID: <b6320b6f-ecbd-bd05-1cb2-ac98aa97825b@hauke-m.de>
Date:   Tue, 22 Dec 2020 15:46:31 +0100
MIME-Version: 1.0
In-Reply-To: <20201220193201.GA3184@alpha.franken.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -5.13 / 15.00 / 15.00
X-Rspamd-Queue-Id: A63D01713
X-Rspamd-UID: da6009
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 12/20/20 8:32 PM, Thomas Bogendoerfer wrote:
> Hi;
> 
> I've started looking how to get rid of get_fs/set_fs for MIPS and
> my current obstacle is EVA support.
> 
> Looking for CPUs supporting EVA I only found P5600, are there more ?
> 
> Does someone sell boards with an EVA enabled CPU ?
> 
> How good is EVA support in qemu ?
> 
> Thomas.
> 
Hi,

The InterAptiv CPUs used by Lantiq/Intel/MaxLinear are supporting EVA 
mode and it is used in the default settings of the vendor SDK.

The SoCs are not supported by mainline Linux kernel, it was tried to add 
them some years ago:
https://lwn.net/Articles/761729/
https://lwn.net/ml/linux-kernel/20180803030237.3366-2-songjun.wu@linux.intel.com/

Hauke
