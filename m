Return-Path: <linux-mips+bounces-12976-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMdzC/MIcGlyUwAAu9opvQ
	(envelope-from <linux-mips+bounces-12976-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 21 Jan 2026 00:00:03 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7FD4D652
	for <lists+linux-mips@lfdr.de>; Wed, 21 Jan 2026 00:00:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0AD8C961FC0
	for <lists+linux-mips@lfdr.de>; Tue, 20 Jan 2026 22:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FD033ECBC2;
	Tue, 20 Jan 2026 22:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FVbssmC7"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF54A3E958F
	for <linux-mips@vger.kernel.org>; Tue, 20 Jan 2026 22:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768949370; cv=none; b=QeGgMump4NQjwyFbPbP76DH9YuxuxwXdVL+CUtQb0z8CauisnLHospDm58RT5vjGVhVtWxXAVlpb6Dt6Xe6FbB4mfHBRZeSExmkTW3TJyINfeEOfQzMQ0gGXDA6NVRDKMqK8A7H145QIQO8I/JBq9L06ALGIaRbUE6DG6jy9sls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768949370; c=relaxed/simple;
	bh=q2BBqQqtjFB8ySi+/D20hdD9Q7tjuVZO2BGEmvHHnRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bl9QvzkIQqUvGSMYAzuMoiNEjzpxG0Vnikaz5WfusQmGzySFSEAZ8Yg2d7IaQmfU7HORLDJMvfNrnNbU+IK0MPJVGBUHxR+RKgCvvWTWyBCm2Ug9OBJYf4zHo+8cAeohDli8i7E6LoJP+jX4CVaLL5z+R5yCvsf4QRC411JN8hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=FVbssmC7; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 748C54E421BA;
	Tue, 20 Jan 2026 22:49:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 47D8E606AB;
	Tue, 20 Jan 2026 22:49:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 03583119B01D6;
	Tue, 20 Jan 2026 23:49:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768949365; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=fugztaeaHNRM37Axp9dzYHeQYhLSc0vSFllOB04u4oQ=;
	b=FVbssmC7V7KjEftXArVr20pRSRzONvUahw0c/uJ9yIFlGaZmiYtUxGfBee25jY8gKO30Xd
	D+WL9xihZY5l7M+nXRjiEvyU5oId/pwZA9cbcN2b9cAaYJ3E8KZVfiZAn4BVV/Y1MO+yfV
	FviIYTMllbUerHXjqioQukTcvkH8CxECbjzxPbXrlUQOkJ3boj1X+Fot+uiMXPVlMzejPy
	K9Ca1t+D5obGrBqQNk2D8sOkIg6Z4vbGFRtQCSKs2SuHWMGy0GnAEogK6DKae9UFwplXx8
	C8+H8R1NfB7MxVPqwlkYpNuoT57OyjRNZpnm1bcyN+tTAvkbzrqd7rrTu3FiNQ==
Date: Tue, 20 Jan 2026 23:49:20 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Conor Dooley <conor@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>,
	Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org,
	Xiaochuang Mao <maoxiaochuan@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
	devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
	Keguang Zhang <keguang.zhang@gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: rtc: loongson: Correct Loongson-1C
 interrupts property
Message-ID: <20260120224920df0cf2ac@mail.local>
References: <cover.1768616276.git.zhoubinbin@loongson.cn>
 <b6295c907410f6708115cba4df0959ee6629f8a5.1768616276.git.zhoubinbin@loongson.cn>
 <20260119-tricking-premiere-ada70700f804@spud>
 <20260120075045e7e864ba@mail.local>
 <20260120-cubical-harmonica-a7b7bbb26b08@spud>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120-cubical-harmonica-a7b7bbb26b08@spud>
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[loongson.cn,gmail.com,kernel.org,vger.kernel.org,xen0n.name,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-12976-lists,linux-mips=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[bootlin.com,reject];
	DKIM_TRACE(0.00)[bootlin.com:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: CA7FD4D652
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20/01/2026 19:24:09+0000, Conor Dooley wrote:
> On Tue, Jan 20, 2026 at 08:50:45AM +0100, Alexandre Belloni wrote:
> > On 19/01/2026 18:24:36+0000, Conor Dooley wrote:
> > > On Sat, Jan 17, 2026 at 10:26:48AM +0800, Binbin Zhou wrote:
> > > > The `interrupts` property indicates an RTC alarm interrupt, which is
> > > > required for RTCs that support the alarm feature, which is not supported
> > > > by the Loongson-1C RTC. We exclude it for a more accurate description.
> > > > 
> > > > Changing the `allowed` property is ABI-breaking behavior, but
> > > > throughout the existing Loongson DTS{i}, the description of the RTC
> > > > nodes conforms to the modified bingding rules.
> > > 
> > > Right, changing properties is an ABI break, but when following the ABI
> > > would've produced something non-functional, breaking it is not really
> > > relevant.
> > 
> > 
> > But the HW has the interrupt, the fact that is not functional doesn't
> > mean it isn't there. I thought we should describe the hardware?
> 
> Does the hardware have it? My interpretation of the commit message was
> that it didn't have the alarm feature and thus no interrupt? Unless the
> interrupt has some other purpose, in which case yeah we shouldn't accept
> this change and only the new device should permit there being no
> interrupt.

The datasheet shows the interrupt coming out of the RTC and it has the
proper registers. Why it is not functional is not clear to me.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

