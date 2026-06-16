Return-Path: <linux-mips+bounces-15108-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id U0eHHIgnMWpwcwUAu9opvQ
	(envelope-from <linux-mips+bounces-15108-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 16 Jun 2026 12:38:00 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C56F568E616
	for <lists+linux-mips@lfdr.de>; Tue, 16 Jun 2026 12:37:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=web.de header.s=s29768273 header.b=FyqR6UFc;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15108-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15108-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=web.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37F353000FCE
	for <lists+linux-mips@lfdr.de>; Tue, 16 Jun 2026 10:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B97C44218AA;
	Tue, 16 Jun 2026 10:35:02 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E633B71DD;
	Tue, 16 Jun 2026 10:35:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781606102; cv=none; b=EZjmACYQZcL/TzO7CYr+leZ9pIRyQ8Pdn/WBggxuOc/ePljJ1wrRQpJWQYRTvv/D9ktCM48mdUQIxI0+FRoiL1N3SV0ojKjIhOq7RELlnMfYETHGl/7Q+2rNbwM/uO6wPjko8CygjY8oIhU8PhZTigM8+LsCVOWS2xNJrfZlSkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781606102; c=relaxed/simple;
	bh=2buH03XnWQoYWaj2aCKVOkhgIs36MHwSUgOL5SYhprw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=IcbcSE3A6KYBpcLpldRwtp8i/4pbnm7L8FmusxGEeqXyLBHKBgeBjOUt+MNtfGFMnuV09RV8T/WEK9JPC7XkCE8IQgScEhBZFK1c7KmL2/vfeOHPxZlbjzc/j5g7s0MfhuDmYPdmtI8XkdQMH84eAGMZmLdlCMiioq4E0ogxiKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=FyqR6UFc; arc=none smtp.client-ip=212.227.17.11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1781606093; x=1782210893; i=markus.elfring@web.de;
	bh=2buH03XnWQoYWaj2aCKVOkhgIs36MHwSUgOL5SYhprw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=FyqR6UFcBoMQ0pMNwocZdcjbC9+NpqDxEyXBiZfJ0NFwHa+Hevq1Jv1Y96AN3/HE
	 GXyHGQrLOFQWvXskeiSMuYQOjvPUaFrPmGrwvGqM0Wn/bO1MFTm5dLLAbmtSt/STw
	 kI7Cd4T9mFffnr+VLLVyaJz7cu4XbdkzjydgkCQnER8YcRsVmReefsMBVi0yaTUyd
	 qunUnz1A9bN0hoUydewKAdVdkPPEADGrtHUO0KxfwM6forl9uUUq/ogKyGZxLHMgS
	 IbeTNXMHPIXagdJNN2BORLSZ3MEQl+i8ercAz8ZSGwaIhZ6b2wXgcd87s/l0zC7uW
	 JFlQvSwi4+vIxeIyHg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N7gXQ-1xDlp045jO-015xIT; Tue, 16
 Jun 2026 12:34:53 +0200
Message-ID: <39fa676a-e761-4a33-9660-f366c692d4f1@web.de>
Date: Tue, 16 Jun 2026 12:34:18 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [0/4] MIPS: kernel: proc: More efficient data output in
 show_cpuinfo()
From: Markus Elfring <Markus.Elfring@web.de>
To: linux-mips@vger.kernel.org, =?UTF-8?Q?Thomas_Bogend=C3=B6rfer?=
 <tsbogend@alpha.franken.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <e9e46083-c250-4e12-8620-f590e9501a25@web.de>
Content-Language: en-GB, de-DE
In-Reply-To: <e9e46083-c250-4e12-8620-f590e9501a25@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kwe+MqIDggktTJklr5QX9OtCCfzfliE+fBqFfUPkccC3nfQvvHI
 ZN8js3ty8FZfWb46Sizqk5NhZs2Ht9OABgm98/g96PPSPUUQ827aTxBsAlMj1puog7/8eDl
 /Ub/APZ+IhaJbkYgQwpGeCObWN4PfnQ3gUmmV0xx0kfe1Q8k/A63AufI0jDLT7M1TeXJmUE
 DeRglY/WnMACvht0SX0mA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:qg/Mu0tfMOc=;DhS/DQmC6Bl/go5Oky8DnY3qBMl
 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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15108-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-mips@vger.kernel.org,m:tsbogend@alpha.franken.de,m:linux-kernel@vger.kernel.org,m:kernel-janitors@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Markus.Elfring@web.de,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[web.de];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Markus.Elfring@web.de,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[web.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,lkml.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C56F568E616

> A few update suggestions were taken into account
> from static source code analysis.

Does the feedback indicate so far that you would like to omit
the patch =E2=80=9CMIPS: kernel: proc: Simplify data output in show_cpuinf=
o()=E2=80=9D?
https://lore.kernel.org/linux-mips/5dcb1ae4-dc98-4f12-8ccb-ff47b16a326c@we=
b.de/
https://lkml.org/lkml/2026/6/4/1819

Will another source code adjustment become helpful?

Regards,
Markus

