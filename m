Return-Path: <linux-mips+bounces-15735-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sc0ADdp4UGqNzgIAu9opvQ
	(envelope-from <linux-mips+bounces-15735-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jul 2026 06:45:14 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA8D7372B4
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jul 2026 06:45:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=atomide.com header.s=25mailst header.b=CTaihVTY;
	dmarc=pass (policy=reject) header.from=atomide.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15735-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15735-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4471D301DBAA
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jul 2026 04:45:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84D36372B57;
	Fri, 10 Jul 2026 04:45:11 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827523603D7;
	Fri, 10 Jul 2026 04:45:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783658711; cv=none; b=qLaHSescImnv3jxRf958iP5majo3qpNpyCANOdcQPZfqgL3qGuUxswf93S3+XVvUWpfvNvZ66h/NFzFHPsMyR/RUxH2IXtt1la9jjZH130fnpjQkoEvifs2Re5pLQafvWt6jBJoi67cUQs3pqxBK+ZYe7Ya+BcK6fiRkiZoZBWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783658711; c=relaxed/simple;
	bh=FwC4nxcw77Dy9Pw4BgEh1WKzMzw00KasgsFTwsY3DRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IUUnEWYa8HS1WKHfBC6b8VCmwOed5EoN1HeTJo4L3eb8wwO9xh1Q9dpjZfgyYEwcSO/krKyAs/HbvWLqJ1mlzIo3qfUH3bC9zWX1In/nb9Uw3/WCwlRfL6C4/SS78R/ENNQ68smxpg1rS21Df5Q9WFv9YHgDXnY01MbdOcqBnoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=atomide.com; spf=pass smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=CTaihVTY; arc=none smtp.client-ip=74.50.62.9
Received: from localhost (84-231-250-126.elisa-mobile.fi [84.231.250.126])
	by mail5.25mail.st (Postfix) with ESMTPSA id C8E32617B5;
	Fri, 10 Jul 2026 04:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=atomide.com;
	s=25mailst; t=1783658352;
	bh=jp+8+5QI95ophkzdeX5PhLSIZp16xbFMwu4QDRkzOEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CTaihVTY3xKeYwYurPIj1PGrGR+oQrwQf6TQ4FUpfmbKGRQQH/0vBl8OOK/WUw/zr
	 +CHCGjc9WZ0h+gMjDXgKIuG0sfG5b8v/fURlsq3junjLdDh4yjLeo/E3mnyZF5ILb5
	 0L9YsyLyaxt3ROVT6g7hv2fvRb3jKJLKIJ+xGvLZkROMhpsQ6xMpDQn/A0jBZLmU4Z
	 ZO8Iro9rshL2Y66OWXG4Ngkys+C/yPaKUbK202WNo4t9V08TAI3OILwZ+ejHZzDyNG
	 eSqlieskQg4bhu+Sw3PZD6vdc9fq9daM5LBBKO5PSTb9Angg33oCQkJipqydJDwaNj
	 eyyRZriX8WpVQ==
Date: Fri, 10 Jul 2026 07:37:46 +0300
From: Tony Lindgren <tony@atomide.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Praveen Talari <praveen.talari@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Peter Korsgaard <jacmet@sunsite.dk>,
	Michal Simek <michal.simek@amd.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	bjorn.andersson@oss.qualcomm.com,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-omap@vger.kernel.org, linux-mips@vger.kernel.org,
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	aniket.randive@oss.qualcomm.com,
	chandana.chiluveru@oss.qualcomm.com
Subject: Re: [PATCH 0/6] tty: serial: propagate errors from uart_ops.pm
 callback
Message-ID: <20260710043746.GM30058@atomide.com>
References: <20260709-add_return_check_for_uart_change_pm-v1-0-e85c6ffa8ec4@oss.qualcomm.com>
 <ak9OPNcVAhkfxHvZ@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ak9OPNcVAhkfxHvZ@ashevche-desk.local>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[atomide.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[atomide.com:s=25mailst];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-15735-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[tony@atomide.com,linux-mips@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[40];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:praveen.talari@oss.qualcomm.com,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:richard.genoud@bootlin.com,m:nicolas.ferre@microchip.com,m:alexandre.belloni@bootlin.com,m:claudiu.beznea@tuxon.dev,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:alim.akhtar@samsung.com,m:orsonzhai@gmail.com,m:baolin.wang@linux.alibaba.com,m:zhang.lyra@gmail.com,m:patrice.chotard@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:jacmet@sunsite.dk,m:michal.simek@amd.com,m:aaro.koskinen@iki.fi,m:jmkrzyszt@gmail.com,m:linux@armlinux.org.uk,m:tsbogend@alpha.franken.de,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:linux-serial@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-samsung-soc
 @vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-omap@vger.kernel.org,m:linux-mips@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:matthiasbgg@gmail.com,m:zhanglyra@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linuxfoundation.org,kernel.org,linux.intel.com,gmail.com,collabora.com,bootlin.com,microchip.com,tuxon.dev,linaro.org,samsung.com,linux.alibaba.com,foss.st.com,sunsite.dk,amd.com,iki.fi,armlinux.org.uk,alpha.franken.de,vger.kernel.org,lists.infradead.org,st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tony@atomide.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[atomide.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,atomide.com:from_mime,atomide.com:dkim,atomide.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7CA8D7372B4

* Andy Shevchenko <andriy.shevchenko@linux.intel.com> [260709 10:38]:
> Just no, please just properly implement runtime PM. The .pm() must die completely.
> I used to have the PoC for that long time ago [1], but due to lack of time and
> other priorities it went abandoned. Also Atlassian made a brain damages move to
> limit repository to 1Gb, so I haven't able to update it for a few years.
> 
> Note, that Tony (you have him in the Cc list) did a lot for some corner cases
> with that and we still have them IIRC. Tony, do you know what is the state of
> affairs with runtime PM for UART?

The RX side of things should work for hardware that can wake up to an incoming
event. Linux for sure needs more work to properly handle the various corner case
TX wake-up of a PM runtime idled UART. I'm mostly offline until Monday though,
will check my notes for more details next week.

Regards,

Tony

> [1]: https://bitbucket.org/andy-shev/linux/branch/topic/uart/rpm-plus

