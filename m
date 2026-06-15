Return-Path: <linux-mips+bounces-15086-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7+RnD1/aL2rPHwUAu9opvQ
	(envelope-from <linux-mips+bounces-15086-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2026 12:56:31 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DCB68586C
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2026 12:56:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=web.de header.s=s29768273 header.b="NQDC/ABh";
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15086-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15086-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=web.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD20930534F7
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2026 10:53:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 594AB36D9EA;
	Mon, 15 Jun 2026 10:53:51 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791B136CE10;
	Mon, 15 Jun 2026 10:53:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781520831; cv=none; b=YVbBpkFFqpxgW+unRVvp11uz4n+nJkd7Vb39Ij60jghMZlvlOa0dypRWf3mY2KRM5xFiJq385tdDpdR+A3vBSnHNbo66LZf+iuUYqDfVx3ZJAvch95Np3My1mI2HcfCj3KRJCETSu8uypyoSXacmfYBkLqJEfB/nuDyriXjZ/mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781520831; c=relaxed/simple;
	bh=rw7oPfmNbrdIZ53xKEzrflJjPhdovno68btCvpjo4xk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XAJOjRwCxnCndz+Sc3pco8L1GK8n1eAJSC0mdWsoXNPypu/JIhQrmhbpDFSiZFGdnnX+Ve+OO4uOiT00S7M+R5LAzzAC+a7++G+dugsJUVIYSMYQ/pVtDgagfU+0i81eWDdixyd6ug1kouiyvuJvoI/E+gpnzVHO1m81EB5rBFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=NQDC/ABh; arc=none smtp.client-ip=212.227.15.4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1781520821; x=1782125621; i=markus.elfring@web.de;
	bh=rw7oPfmNbrdIZ53xKEzrflJjPhdovno68btCvpjo4xk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=NQDC/ABh6oPRPHR3TfUfosGylJJt+g0eHF3xA8tux7EnvPw1isEX/zaBAI42fsbW
	 6XITdttG4DnUV4aGyy/0ViI5JzzMVPFq6Ho6g7OORauwb7MUwLc8dWWGSXFV30b0P
	 JhjZLuz0Bu8lqm3BKPb5Xwx9CQWj5LTfj50QykQK2x+QByJl/Ls/k/AXe++CS2cQi
	 ImcQopmQhlpCsd2GwD6sjh+1LEXELl/xuY8QNEUnFwA/ppFrHaOwEUxSyEjuGtLF3
	 7nKMrHA2712DLUSUcEm4Vy2t9PNZJ0hwySwmk10UBxSsV+XXQd89Iz+VanRBokL0g
	 QaXBSTrJEixFodqt4w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N0qv3-1xSgCW1Rh7-014sHX; Mon, 15
 Jun 2026 12:53:41 +0200
Message-ID: <ce3f4b33-1b4f-4125-a6da-a0dc6bf5897c@web.de>
Date: Mon, 15 Jun 2026 12:53:40 +0200
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
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ECVsRKJXlZ5ghCeIX3TA5XZFRicXY/HV18+LgS7+MwIuVwZ7baY
 0d91+zbhZWEdAkZb29HMAQgWdcLI8LOD2SJmd/20NaeFk6Pp44iMUXpoDCRwPFVFDer0wqR
 F9PJq0rvwGEdJfc7xZXk1zgnIFwndG6KjVN2RfdrCGLy3l+0NkSTKTsG9j8VnaVCCwyhxzq
 kdHRFaRPA++3UNl6hDOog==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:QH+0DNuQzMU=;gTFfghKR8QtS/LDj0Ao0kzaX/TH
 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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:error27@gmail.com,m:tsbogend@alpha.franken.de,m:linux-mips@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kernel-janitors@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[Markus.Elfring@web.de,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[web.de];
	FREEMAIL_TO(0.00)[gmail.com,alpha.franken.de,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-15086-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A2DCB68586C

>>> Do not use curly brackets at one source code place
>>> where a single statement should be sufficient.
=E2=80=A6
> Generally, in most kernel subsystems the rule is that multi-line indents
> get curly braces for readability even when they aren't required because
> of the syntax.
How do you think about to adjust any process and software documentation ac=
cordingly?

Regards,
Markus

