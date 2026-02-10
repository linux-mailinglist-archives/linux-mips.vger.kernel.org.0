Return-Path: <linux-mips+bounces-13153-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Cz2A8kni2m6QQAAu9opvQ
	(envelope-from <linux-mips+bounces-13153-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 10 Feb 2026 13:42:49 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8300011AF07
	for <lists+linux-mips@lfdr.de>; Tue, 10 Feb 2026 13:42:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E3ED303E490
	for <lists+linux-mips@lfdr.de>; Tue, 10 Feb 2026 12:42:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFF191E9B37;
	Tue, 10 Feb 2026 12:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QJxAFGAy";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="IFZWnSsK"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646C28632B
	for <linux-mips@vger.kernel.org>; Tue, 10 Feb 2026 12:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770727353; cv=none; b=c3RxV1aeavw4BRbyo/8I9ZiEq9h48BYi8f9PoUd9Bzjbt8Mv0398CgRrLCKqRXAlaKqM69LtePU3g/STZSJw5YbweHe4b167HjVzkISHMZ8EOZBIZNfx7lzfcmBgER4gt6Oy9yRGDAqgJULTwcsufIFF9HQ4Qinow4+0FFUAVts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770727353; c=relaxed/simple;
	bh=GlKpwAqt8FXcLxnYzpl9cDfIBN0bnkDbFsP/hLk3P+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tlvt7oJsn5sOvhqyIJv4c6r1N3WMQgsm01HfF5fUwUoqjT9zUaoH8M7IxCdl5tIbB9YsIdjASR+kPwJTgLnRhwWn5QwUSctzJgM7sg0IxMwmqtRjime/rY8VCNu7367n8ipqG5311G8P0glOm1nHp9Cc4Yxg+GkSXcG6Ofk6c3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QJxAFGAy; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=IFZWnSsK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770727350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WIPR0mr/henT5bqfT/DKonkyulUdL16MgQRnA6kCJNo=;
	b=QJxAFGAyIKmrh2zuPDOEVxHSSsQ+Jf7L+htFf5vMa5tb/Cu2euhDMn8dx+Byo8R8Hudl9M
	BpdK0u2HUQIRXeSHGclPm1/WNzXqAF5OCPAl4MHZCloX5odBLEeYrwFTZ/DjeyfEedxfHK
	MqvZw5fHRmFufbcnVBE5rEz3/axQbn4=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-N1hgpssBPAuJGCZG5qqrkw-1; Tue, 10 Feb 2026 07:42:29 -0500
X-MC-Unique: N1hgpssBPAuJGCZG5qqrkw-1
X-Mimecast-MFC-AGG-ID: N1hgpssBPAuJGCZG5qqrkw_1770727349
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8947d47793fso257695096d6.2
        for <linux-mips@vger.kernel.org>; Tue, 10 Feb 2026 04:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770727349; x=1771332149; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WIPR0mr/henT5bqfT/DKonkyulUdL16MgQRnA6kCJNo=;
        b=IFZWnSsKBQErk8CB8YJCIzGXGKhz4eZMSqPEtLSbj/uwH1A49Xj8LoEJhF6pcy7d2N
         wlrMn9/Sn1Mo4z1rC+00Go3UA6lbA3d6Hv4jolfseNvy6ah3yscypptRH74J9Ncsk6t1
         xD3mQC4Rnp8JTe0NG29vD8wdEU8kt24v6HpCcHydeRNMA6gp8lsgxaOr6upY/soKLji+
         WQtuTUoh3cqzEHwDKL5M2UpPRLACMunCmNF26lRd+oRTofcRF95ITIIln15DqswXvFOc
         rMsxu5C/5vi4M81xOYakJto56DcPPVPy8OmgVfkHCHCdcIFUSLgn67uLW3Z7ftTpq6R+
         6NOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770727349; x=1771332149;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WIPR0mr/henT5bqfT/DKonkyulUdL16MgQRnA6kCJNo=;
        b=H91TcNZC1XtBmEAJakoKxQWhErBAbmKd+e5xOsVpMk5XHvJKnrLwNmi236FETdAjEw
         +RtEJwWHJ4dYaR98NB/aM3zu8HyXbPnBausPk3nsjO4M9DAAr3vy2JSiyiUvicyGhI6V
         YpBuRsC9F2HNsGR7PDAYmrtuotnSKkizow5F1dIAiMBppB+4rcR1urhvOYBvg0/I4MiY
         Vrt83d66GacKQIdJ9ZpEQn+ZXuzZxdGLKG6jsRT5M+KUXGNV+eehcu176aXxq6v7EgII
         59VQE1oV5EeFewDdP+9l5s8vuzid8jCMisfCWD09ppdh54WqVnLS02amm8WmSjloBRi9
         H3FA==
X-Gm-Message-State: AOJu0YxOKMiCFVm64EZidc/6ISKP5LC+Ac2TZtY2dUY5YsyQcETjnynu
	DyGRfotFqBnUBJHbsmGyktWl9tnr3s9ZDfrsC19QCg24io9zskLPxj5JjIuoDrHzijqTH7XLXYl
	Ab63Ijacd/bmGegnlc7+fzpXFoEa4rizozxU+E4h/Ur5g3vWwUzWkY9vRgmSQd74=
X-Gm-Gg: AZuq6aL2wT1iMEWL7fLpP8NjxLPZ8jhorufLrXLEJ4HQHhSlfZiF91xmBhXLDk/JcsG
	hGmmCiGykh5bXsq8RLNINOW/2VL/JUDeTwnzq71y+OUc4ZTevktKPk2p60S+1zPlytoUP1BAFQc
	TgxtdXdw4w8E1Ibz6JnNFN4+PDNC32k+Ej0k0OXGMfx3wnaKMIwQxSnCCLsGGApHuNnILj6h1Cu
	QCXAK07vkBc+XCujLTsRu6HRBSMj3nn3yNA1KDwcUA+qaM6/nAjz+qFnrjF1h1WgB3/NySrE17+
	WkxsM/SmF/QoJuAyVX6bAu5KRD+A8WXQ0MLhytU3Z+cgGfqD0U7XeApil4MHN4iCM6yJaowy75u
	dI47Xy/Yat21OftNGGBYiW5UzvYszvqCTZLaXTdQfd+ExokSyTIgza5KB
X-Received: by 2002:a0c:f952:0:b0:895:4cc2:8bfe with SMTP id 6a1803df08f44-8954cc28dc4mr97314036d6.48.1770727348930;
        Tue, 10 Feb 2026 04:42:28 -0800 (PST)
X-Received: by 2002:a0c:f952:0:b0:895:4cc2:8bfe with SMTP id 6a1803df08f44-8954cc28dc4mr97313856d6.48.1770727348578;
        Tue, 10 Feb 2026 04:42:28 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8953c0599b4sm99582176d6.41.2026.02.10.04.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 04:42:27 -0800 (PST)
Date: Tue, 10 Feb 2026 07:42:25 -0500
From: Brian Masney <bmasney@redhat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, linux-serial@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH v2 00/16] MIPS: move pic32.h header file from asm to
 platform_data
Message-ID: <aYsnsecPa8bWMbaA@redhat.com>
References: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13153-lists,linux-mips=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8300011AF07
X-Rspamd-Action: no action

Hi Thomas,

On Mon, Jan 12, 2026 at 05:47:54PM -0500, Brian Masney wrote:
> There are currently some pic32 MIPS drivers that are in tree, and are
> only configured to be compiled on the MIPS pic32 platform. There's a
> risk of breaking some of these drivers when migrating drivers away from
> legacy APIs. It happened to me with a pic32 clk driver.
> 
> Let's go ahead and move the pic32.h from the asm to the platform_data
> include directory in the tree. This will make it easier, and cleaner to
> enable COMPILE_TEST for some of these pic32 drivers. To do this requires
> updating some includes, which I do at the beginning of this series.
> 
> This series was compile tested on a centos-stream-10 arm64 host in two
> different configurations:
> 
> - native arm64 build with COMPILE_TEST (via make allmodconfig)
> - MIPS cross compile on arm64 with:
>       ARCH=mips CROSS_COMPILE=mips64-linux-gnu- make pic32mzda_defconfig
> 
> Note that there is a separate MIPS compile error in linux-next, and I
> reported it at https://lore.kernel.org/all/aWVs2gVB418WiMVa@redhat.com/
> 
> I included a patch at the end that shows enabling COMPILE_TEST for a
> pic32 clk driver.
> 
> Merge Strategy
> ==============
> - Patches 1-15 can go through the MIPS tree.
> - Patch 16 I can repost to Claudiu after patches 1-15 are in Linus's
>   tree after the next merge window. There is a separate patch set that
>   fixes a compiler error I unintentionally introduced via the clk tree.
>   https://lore.kernel.org/linux-clk/CABx5tq+eOocJ41X-GSgkGy6S+s+Am1yCS099wqP695NtwALTmg@mail.gmail.com/T/

Sorry about the duplicate message. I just wanted to reply to the series
with MIPS in the header so this message isn't lost.

Can you back out these two patches from your tree in linux-next, and not
send these to Linus?

clk: microchip: core: allow driver to be compiled with COMPILE_TEST
https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/commit/?id=026d70dcfe5de1543bb8edb8e50d22dc16863e6b

clk: microchip: fix typo in reference to a config option
https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/commit/?id=a6ab150deb4b740334721d18e02ad400a9d888f5

See
https://lore.kernel.org/oe-kbuild-all/202602100954.BAVYq6aC-lkp@intel.com/

All of the other patches with the include changes are good. I have
patches queued to send out in two weeks to other subsystems once the
include changes land in Linus's tree.

Thanks,

Brian


