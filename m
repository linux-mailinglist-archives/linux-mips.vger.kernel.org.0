Return-Path: <linux-mips+bounces-15087-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FRMELMbeL2rgIAUAu9opvQ
	(envelope-from <linux-mips+bounces-15087-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2026 13:15:18 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 24580685A1E
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2026 13:15:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=web.de header.s=s29768273 header.b=ZwsJCn71;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15087-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15087-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=web.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0E3DC3020873
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2026 11:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91FFA3E3C48;
	Mon, 15 Jun 2026 11:14:03 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847732DEA64;
	Mon, 15 Jun 2026 11:14:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781522043; cv=none; b=qHopmkF6LWlzeldIz8tDmSnHCl0f/gOYOGrxgXJF/Naf/ok0esYsrLk7OEmxL0IGdBgSzP6IS3oCmFUFtoCeOGBvBKdQuTIvF/t+rtKsqQpU8bqpsWd2uv1Wv5l8E4MYqX3A7JWjknOc7WK0dNC0ZGsbkK6CSnMWryodnSKfhWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781522043; c=relaxed/simple;
	bh=1vfdu0rmVpeYex+9+vobYr24gd8XM+VEWuieXp0x+pE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VKv16Oeu4rVLHTHCKlW/mhy0EnsD/d5hsgAZIp3yZVtrbDGARfAx7xOJmyYvMLV2ILgv8IpHU8O4oAB3fwEJfpRlBa7FPQqDBT/KIyTcebEGfe9VHgd/P3O9LPyDckCCCmo53AZ6/mx39/6ia7Wty7KUXSQNzyv2HLrd09hF2qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=ZwsJCn71; arc=none smtp.client-ip=212.227.15.14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1781522033; x=1782126833; i=markus.elfring@web.de;
	bh=1vfdu0rmVpeYex+9+vobYr24gd8XM+VEWuieXp0x+pE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ZwsJCn71ApHSkJ5aLNczlQIA8d1xU9kNFJjSDOskvdKRzL9lCnfL5uWaSWStUVlj
	 ULkYEayT52EbZofztmZrJpCS1k/coFEX9utsPmXmkCzG5R5t3V6Ibe5z1RiMX+3hB
	 nZ9+njdAf/SQrsc1cTuwf7NNGxW4hB606iBYFADXExknynjDOstIeEqSjppHJr7YZ
	 V4cEH7y5e3SFhzNGWuCYe63tmP9SCHemHgG4GSaZXrk9AsVuJ0inOP2tcNUfSE3JB
	 6wKhz0lmGKW913HwHQ+QG5Ce7dKEAOIe4vr/9DC+OP+z49sRLh91Yz+VVTohW9wMu
	 bBaZOPFBJx2ZrCjQ9g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MdO56-1x892116lE-00jkwh; Mon, 15
 Jun 2026 13:13:53 +0200
Message-ID: <14c8e688-15d3-4821-abf6-e534f536f893@web.de>
Date: Mon, 15 Jun 2026 13:13:51 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [4/4] MIPS: kernel: proc: Delete unnecessary braces in
 show_cpuinfo()
To: Dan Carpenter <error27@gmail.com>,
 =?UTF-8?Q?Thomas_Bogend=C3=B6rfer?= <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <e9e46083-c250-4e12-8620-f590e9501a25@web.de>
 <7c7d97b0-37bb-4e7b-9b2e-49a7c10eb6c5@web.de>
 <ai_UUB7ouRSE1KEw@alpha.franken.de> <ai_YQwmgIFgWj0tj@stanley.mountain>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <ai_YQwmgIFgWj0tj@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:J9f/0chPuHaypnPMvlWFA11MCQjfvEzjXSQaPmrl/DLFP/v3Ot3
 xZwIuSlNN2IznML+qtM/KNw9IW+pORq5wGKnnI4Z6ffXiddxRnmyy+NWJ6ufhXVtR1ddSoB
 BzAotpt0SvQVQfZamaP/laOuVCNDPIfFR7hhVg5J4T+Ms3SqC5WSoOsDC1w57jG21vUd63v
 fjL/Shel1oYEr2Lexm2Ig==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:eiVjeA4zq5M=;6mk5IGqAUzMsfHP8lIsWYADyJpH
 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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:error27@gmail.com,m:tsbogend@alpha.franken.de,m:linux-mips@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kernel-janitors@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[Markus.Elfring@web.de,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[web.de];
	FREEMAIL_TO(0.00)[gmail.com,alpha.franken.de,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-15087-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Markus.Elfring@web.de,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[web.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 24580685A1E

> Generally, in most kernel subsystems the rule is that multi-line indents
> get curly braces for readability even when they aren't required because
> of the syntax.

By the way:
Would you eventually prefer any other indentation (or formatting) for
the affected statement?

Regards,
Markus

