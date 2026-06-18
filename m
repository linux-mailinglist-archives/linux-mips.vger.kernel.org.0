Return-Path: <linux-mips+bounces-15129-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RPO+HSdCM2oB+wUAu9opvQ
	(envelope-from <linux-mips+bounces-15129-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jun 2026 02:56:07 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8472B69CEF2
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jun 2026 02:56:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b=eERmQ0ay;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15129-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-mips+bounces-15129-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7E49630982F6
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jun 2026 00:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4572423E324;
	Thu, 18 Jun 2026 00:56:04 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D9722D4C3;
	Thu, 18 Jun 2026 00:56:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781744164; cv=none; b=erDoklhcNWRJPLaavZp/KRUj4iTgA1IQ68PBxgpAmlInc6Tn1LeTx+FrVelBR6bQZJgXN/+KKqXjVdLPejzAEcB3oQsYO4EZs6a47+J/IPPIbEjfUiS86mPZuqGyTJgkaoKziJLGCQ/tVVzYYgrKjeSXM0zNXmoebTprQOzHlYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781744164; c=relaxed/simple;
	bh=RbRV3/bgZeP5ukGhZT5t5PNTGVWFGDhPacX80uNTx3E=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=nhpfBR0toEu6IQS2V78rJGiCL6HM8vIOg79xrfQDA3TUfE3hoaVvWP+LTns2vE2Rad6vGn1ncKGKNuSpgmikat7bLTQKs4GB/BqweDK90TPygXP2KLhpJPw0MtEkMCVftO8kQ1ho9X+YM3MeKH8cZo0ofE4RSNCQyJcqZBtkFjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=eERmQ0ay; arc=none smtp.client-ip=103.168.172.145
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id 3738DEC05E7;
	Wed, 17 Jun 2026 20:56:01 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Wed, 17 Jun 2026 20:56:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1781744161; x=1781830561; bh=oRkffw0hyh/GuxJCIVfKgEWNAymvT88Y3XY
	px2BDW/k=; b=eERmQ0ayn9m8wVNhOnqGRZkMB6lds2D6/ZBX5aKImkIIXfgOTbi
	bBSDJcR8oILGjvE3+26/CCmg1rMxDZhplAMhmLr74EdkgR03Fzo3Pr33uMyYzruw
	fLWbiYpqvFnIKO1OkdZ/lTWnLN9ZqzlKZ+Pmae7qKjlBGAAT5assyNo9DU2CLm2n
	hcYgUn9Dcuv0J6tYCTvW0YPaOY9hT4bfB/Ypusbfl/uBe5yp+sMGPTWW3FfNlwXf
	yG8FsMyCEJ6CCpuqkbMQFgtW5XCsF/M919yTmBgRSXTDhPvZxrrcNhKur7CAJ3xw
	F55/rzSyXReRpHb7PsV+qL0k/H92V0c4Itw==
X-ME-Sender: <xms:H0IzarJoPpga0EVjkyYtDAKpuylNksfat_NvfCUhWSOCtjwCzF_f-g>
    <xme:H0IzamHdndkLe1JzQqFpQuE1xFHz02NY7tkG3dJxEwoiSQfMF57TOdJOmPEwKtHzY
    KcN0CeNNl1_j8Yp4J3GkmQjc6ElL7AejiJQZOjTqnxH4p3h_WesQA>
X-ME-Received: <xmr:H0Izaoy6d2LWswGUSgdxEZiGOOIp7F1GAzeKRKpSJyrH0AcCv47p3z-pU9ecUiICg3vu-MH_bhj3VeOXZCQlmtdBfz8XK8kBIME>
X-ME-Proxy-Cause: dmFkZTEfsd2sy6rGCX9gKFtzw6P16veTBgEOvotvsGqzQMeY4e0byjs4rXjd0jR1EGh9lH
    Yq1ys3Ja4IDwXPS3v8h80XGdeqX22kwtwfnwKbBWzdXMbQ3K21J/sdYHJ69m1M3WmEMdIu
    u1nMszQRk8K9LYU0Q7Q7bmIKdExPNa6BOQgw7kl30YHXVdwKmJf3E0sJPtu/GsirOjXIP1
    OMohMujEERuDNRRVoYibAAjRUfzIntuPTXU4ZMzzhV1KO9u+QyuBjvQZWPFHNeoyfVgbrS
    xKlIz72VPlV0PJCNH8exmh65DDQ4fM9o2UBLSyaOZeAPSCtscvI5N+qb7q9WWVzoyMW0KJ
    OK/PhdNbZwjAicc4o1XuhSDvlAX5cy+FtEEvV2F6GwZhMa+lPcgdxqF8OBb/lmLupQ5tEs
    eheTqaLv4Nsg7nu414U6XqgJZzeXjEHoQKyhhj/PW+xu5f6FM80JRxgBdtwG9jllgL7YcC
    yqXxG7Cj/sJGT3xVSMUgNWvoLGL7Kb6t1s9H5aAAQMPyEY0Lgd7FGNcJuDBha9e0gs/fps
    iOWIrG6DUpVNDUVADq/vCJwf9Ebi7fmT8Ljiah57AZUCaHj9g2RUI1FwTR5wI2qitIaKqu
    uLTAsCEPC2PcldxNQjt5opO4jHMZ5Rs2C0Zvi0g1/JJ5wDCgBUftZn/Xom5g
X-ME-Proxy: <xmx:H0IzarhtWgRuIMlu2p5-tLhgH2FkJtO7O_M4iRkuEoFf70ad5bOd_A>
    <xmx:H0IzatL7Euk8fVpAZfJJAWzsTcu0W72nRDeXBvUtVs0R9OUKs0mo6Q>
    <xmx:H0IzauC7vQlbiuSjd4tSULVmpAMAV6fSiI9w8wwt0RrhGN4Z63PPVg>
    <xmx:H0IzauSGYEJXZzWQrOlUMtDDUANieswg55yx3NL-E1fVReVzaCOU8A>
    <xmx:IUIzavmfDbaASv4X0vfqP16GYSQdU_zCwOTdK2L0zg5ukH_f6P9Pfp7h>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Jun 2026 20:55:57 -0400 (EDT)
Date: Thu, 18 Jun 2026 10:55:54 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Carsten Strotmann <carsten@strotmann.de>
cc: Jakub Kicinski <kuba@kernel.org>, Carsten Strotmann <cas@strotmann.de>, 
    John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
    davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com, 
    pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, 
    geert@linux-m68k.org, chleroy@kernel.org, npiggin@gmail.com, 
    mpe@ellerman.id.au, maddy@linux.ibm.com, linux-mips@vger.kernel.org, 
    linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH net-next 0/2] appletalk: move the protocol out of tree
In-Reply-To: <1781694488854.956546368.818588236@strotmann.de>
Message-ID: <489024bc-b6e5-f601-3bce-444d75abbf5d@linux-m68k.org>
References: <20260616084901.3319d82e@kernel.org> <1781694488854.956546368.818588236@strotmann.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-15129-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:carsten@strotmann.de,m:kuba@kernel.org,m:cas@strotmann.de,m:glaubitz@physik.fu-berlin.de,m:davem@davemloft.net,m:netdev@vger.kernel.org,m:edumazet@google.com,m:pabeni@redhat.com,m:andrew+netdev@lunn.ch,m:horms@kernel.org,m:geert@linux-m68k.org,m:chleroy@kernel.org,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:maddy@linux.ibm.com,m:linux-mips@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linuxppc-dev@lists.ozlabs.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER(0.00)[fthain@linux-m68k.org,linux-mips@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[kernel.org,strotmann.de,physik.fu-berlin.de,davemloft.net,vger.kernel.org,google.com,redhat.com,lunn.ch,linux-m68k.org,gmail.com,ellerman.id.au,linux.ibm.com,lists.linux-m68k.org,lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[messagingengine.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fthain@linux-m68k.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linux-m68k.org:mid,linux-m68k.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8472B69CEF2


On Wed, 17 Jun 2026, Carsten Strotmann wrote:

> > _Someone_ has to handle the reports and patches. And since nobody is 
> > doing that the code is going to GitHub, where it can continue to "just 
> > be left" or whatever, without racking up CVEs for the Linux kernel and 
> > leading to maintainer burn out :/
> > 
> 
> That's a good point. The large influx of reports is a problem, and burn 
> out of maintainers is a too high cost.
> 

Carsten, if, as a maintainer, you want to avoid burnout then

1) don't promise what you can't deliver (that is, decline sponsorship)

2) delegate (that is, leverage AI as an ally not as a lame excuse)

So the question remains: what is it which _can_ be delivered by and for 
the "community" (by which I mean, that group of people which includes 
actual end users -- not merely paying customers and sponsored developers).

This question has precious little to do with burnout, but it's the 
question we need to address.

