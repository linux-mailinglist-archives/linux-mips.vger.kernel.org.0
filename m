Return-Path: <linux-mips+bounces-14485-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wG7VHtZf+2kuaQMAu9opvQ
	(envelope-from <linux-mips+bounces-14485-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 06 May 2026 17:35:50 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E38F04DD5AD
	for <lists+linux-mips@lfdr.de>; Wed, 06 May 2026 17:35:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D9E9630D44D7
	for <lists+linux-mips@lfdr.de>; Wed,  6 May 2026 15:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D70348C8BF;
	Wed,  6 May 2026 15:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="jb74YaeK"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD86B48C405;
	Wed,  6 May 2026 15:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778081247; cv=none; b=lr8eXBQ5Ng9cyTpAFP7S9t1RwVV5gNqBg3NG/SlR32QxsnTclYsXo/LmhuZEymW+Qk7YoXiJfS+Q8qb4/bm+1CdJP3gwsjl0W9KdliV6xRIbfmilA8sgQfK3pO62VDzGnuFO/lp21uGThEOS4dNMtVC2w7t/XbWOovW7T5T184s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778081247; c=relaxed/simple;
	bh=FEvngRTBTYk4B9n3K7Okanm/jldFJ4FdUeITv2+Pte4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ey6tQwooHreCaAFymd+q1Unde2IhrJUdYK7Akna79vEDio63U0rTzwhSMg+CITYa96L1ZPqUcjrrMQKNJq76x4fRHkxbcTP9+o2AR1ze48eMBp6+Fya96nVPh7Elunp4WwbZ/77cF+0i6dmBJ6ecfIiaKI8jOgNAYFUMiyu/vDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=pass smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=jb74YaeK; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A42FF306F35;
	Wed,  6 May 2026 17:27:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1778081236; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=8HE3m8x+hz3IF4eoayZQahKTddy0WxRCJveHFD/TVLs=;
	b=jb74YaeKXYNfIDXcQFgTn+cCHMxjIEgbtCghknAiPXAvLLe7C9p3N469XNYG0O9Ew/3app
	tMM7yQKSrFBk4r4JPAGw7mIJp1O2u/gjQnsbgBT59O+kANRSIUK7kx+PMu49lPG1TzSDMc
	p8eG7y6JeIihr5i1FIsZ6nhrtN1ZnAi6jEmXExH/j46tr1/Fs6jLp6f7RFGbCrwqIlAyt6
	JBkRMYG7UZ/UoAJQplY8AOvvxOQaQ3Vr7aJdTXLK37bbwycpl2gbYH85brNkSga4698TFk
	olq7HyGuNV8fXRkSMMFZVriQ03dnicGI4jPHwSDnBIJ0GJLsJINT24N2zxSTQg==
Message-ID: <b37dd665-3d25-4627-ab04-17431d9931f4@cjdns.fr>
Date: Wed, 6 May 2026 17:27:08 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH 2/2] clocksource/timer-econet-en751221: Support irq number
 per timer
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
 linux-mips@vger.kernel.org
Cc: naseefkm@gmail.com, daniel.lezcano@kernel.org, tglx@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260416175101.958073-1-cjd@cjdns.fr>
 <20260416175101.958073-3-cjd@cjdns.fr>
 <e5851014-3f9f-4e5b-bdfe-8c277f581155@oss.qualcomm.com>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <e5851014-3f9f-4e5b-bdfe-8c277f581155@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: E38F04DD5AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[cjdns.fr,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[cjdns.fr:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14485-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cjd@cjdns.fr,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[cjdns.fr:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,cjdns.fr:dkim,cjdns.fr:mid]

Hello, thanks for having a look.


On 06/05/2026 16:39, Daniel Lezcano wrote:
> On 4/16/26 19:51, Caleb James DeLisle wrote:
>> This timer was first developed on the EN751221 which is a MIPS 34Kc
>> and therefore has a custom interrupt controller. The hardware for
>> econet,en751221-intc implements percpu routing of the timer
>> interrupts.
>>
>> However, the EN751627 and EN7528 are MIPS 1004Kc based, and
>> therefore use the standard mti,gic compatible interrupt controller.
>> This interrupt controller uses a different IRQ number for each
>> timer interrupt.
>>
>> Add support for both models in this timer driver.
>
> Given the changes done in this driver, the description is short and 
> does not explain why the code is so impacted.


Fair enough. Supporting the two different IRQ models lead to an annoying 
amount of changes.


>
> I suggest to split the changes in order to facilitate the review process


Okay, I'll see what I can do in this regard.


Thanks,

Caleb


>
> [ ... ]

