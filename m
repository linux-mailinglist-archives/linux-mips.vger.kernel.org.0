Return-Path: <linux-mips+bounces-15342-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zHJqKWxXQ2pRXAoAu9opvQ
	(envelope-from <linux-mips+bounces-15342-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 30 Jun 2026 07:43:08 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 143526E0821
	for <lists+linux-mips@lfdr.de>; Tue, 30 Jun 2026 07:43:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=lpt+CfYR;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15342-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-mips+bounces-15342-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0942B302BCF8
	for <lists+linux-mips@lfdr.de>; Tue, 30 Jun 2026 05:43:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A2AE3E275E;
	Tue, 30 Jun 2026 05:43:04 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2DF3DFC62;
	Tue, 30 Jun 2026 05:43:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782798184; cv=none; b=ilCg2DFCybm3IZr6twgrdz3EAU01HPq/KWhAVfTlVUHv/XGtlnLkgFsrC/dMV9ZTiaHoXxERsmP2njwg4rQPuQyt7LbL6EBoGgqUeexynkZmfLCY8T/dfP1Bi3QbavqQokqqJWWMf1YJO6TLe+XBvs/1k853kzDxOoD1ICU1TAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782798184; c=relaxed/simple;
	bh=tEEuT4CIyRD62q1uJ0Hh4ARuooiWtwdiF0w2YbEVei8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PvG1mO1kP3cOd8uL6NLnxuDZy5ve0+40U+xkKbOBsx/gVDJqTR+SQaCNgj9aFRSmVYigiHm6d/L2SasqUQFwu7NvIDooNnX7RQoPP2OmCR/gyCTBefm1b04OapYgo/E8VjwhkYgQXlnXmJATPqk1TxkqC0jPtXqbWT93k8yAKS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lpt+CfYR; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A289E1F000E9;
	Tue, 30 Jun 2026 05:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782798183;
	bh=igxwWpzlFSopf+el4O8TcHKJCfMcOLCTi+hDs6e1D+Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=lpt+CfYRk3Q99LpJlwFxgTN9RsRnY/igkojf9nPokh5MzHw2L/Rd0ry+lKFWEA7YR
	 4Dxc3bjWtLs1ulYOpcKOhQHS2VD07EP9h3zD4+S4OO6CsoYOqOUh9//cSIMfjO/GYP
	 w8V2nNCpf+OvIisd7iT//Y3rhZQIHgNV2Ihif4C2beREDT2iqrLNXvaK/Mmar6+sgO
	 5JbF+bLh59RAXxFeUtYhGqdhI/As66DJW49vyCfOPmF5Y6sfL5kffgvUNYtx3Yl4Jj
	 tojaWUW3L38ftWUqjHIbhbB3iPwS5U6Uy/+oqjJ/3AhYyyM2qsvWuhBzcG7lsnc0vM
	 spNRjylVEiQNg==
Message-ID: <3246b02a-cf54-4777-a238-207925a2dfcd@kernel.org>
Date: Tue, 30 Jun 2026 07:42:51 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-deletions] net: remove ax25 and amateur radio
 (hamradio) subsystem
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, federico.vaga@vaga.pv.it,
 carlos.bilbao@kernel.org, avadhut.naik@amd.com, alexs@kernel.org,
 si.yanteng@linux.dev, dzm91@hust.edu.cn, 2023002089@link.tyut.edu.cn,
 tsbogend@alpha.franken.de, dsahern@kernel.org, jani.nikula@intel.com,
 mchehab+huawei@kernel.org, gregkh@linuxfoundation.org, tytso@mit.edu,
 herbert@gondor.apana.org.au, ebiggers@kernel.org, johannes.berg@intel.com,
 geert@linux-m68k.org, pablo@netfilter.org, tglx@kernel.org,
 mashiro.chen@mailbox.org, mingo@kernel.org, dqfext@gmail.com,
 jreuter@yaina.de, sdf@fomichev.me, pkshih@realtek.com,
 enelsonmoore@gmail.com, mkl@pengutronix.de, toke@toke.dk, kees@kernel.org,
 crossd@gmail.com, jlayton@kernel.org, wangliang74@huawei.com,
 aha310510@gmail.com, takamitz@amazon.co.jp, kuniyu@google.com,
 linux-doc@vger.kernel.org, linux-mips@vger.kernel.org
References: <20260421021824.1293976-1-kuba@kernel.org>
 <0883a8e0-e8b4-4f22-bfc6-dd4a0fcf8b7a@kernel.org>
 <8458cf47-43f3-4328-bc6a-9aac31f1acf4@kernel.org>
 <20260629152930.4c2131ed@kernel.org>
Content-Language: en-US
From: Jiri Slaby <jirislaby@kernel.org>
Autocrypt: addr=jirislaby@kernel.org; keydata=
 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
In-Reply-To: <20260629152930.4c2131ed@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-15342-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kuba@kernel.org,m:davem@davemloft.net,m:netdev@vger.kernel.org,m:edumazet@google.com,m:pabeni@redhat.com,m:andrew+netdev@lunn.ch,m:horms@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:federico.vaga@vaga.pv.it,m:carlos.bilbao@kernel.org,m:avadhut.naik@amd.com,m:alexs@kernel.org,m:si.yanteng@linux.dev,m:dzm91@hust.edu.cn,m:2023002089@link.tyut.edu.cn,m:tsbogend@alpha.franken.de,m:dsahern@kernel.org,m:jani.nikula@intel.com,m:mchehab+huawei@kernel.org,m:gregkh@linuxfoundation.org,m:tytso@mit.edu,m:herbert@gondor.apana.org.au,m:ebiggers@kernel.org,m:johannes.berg@intel.com,m:geert@linux-m68k.org,m:pablo@netfilter.org,m:tglx@kernel.org,m:mashiro.chen@mailbox.org,m:mingo@kernel.org,m:dqfext@gmail.com,m:jreuter@yaina.de,m:sdf@fomichev.me,m:pkshih@realtek.com,m:enelsonmoore@gmail.com,m:mkl@pengutronix.de,m:toke@toke.dk,m:kees@kernel.org,m:crossd@gmail.com,m:jlayton@kernel.org,m:wangliang74@huawei.com,m:aha310510@gmail.com,m:takamitz@amazon.co.jp,m:kuniyu@
 google.com,m:linux-doc@vger.kernel.org,m:linux-mips@vger.kernel.org,m:andrew@lunn.ch,m:mchehab@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[jirislaby@kernel.org,linux-mips@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[46];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jirislaby@kernel.org,linux-mips@vger.kernel.org];
	FREEMAIL_CC(0.00)[davemloft.net,vger.kernel.org,google.com,redhat.com,lunn.ch,kernel.org,lwn.net,linuxfoundation.org,vaga.pv.it,amd.com,linux.dev,hust.edu.cn,link.tyut.edu.cn,alpha.franken.de,intel.com,mit.edu,gondor.apana.org.au,linux-m68k.org,netfilter.org,mailbox.org,gmail.com,yaina.de,fomichev.me,realtek.com,pengutronix.de,toke.dk,huawei.com,amazon.co.jp];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,netdev,huawei];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 143526E0821

On 30. 06. 26, 0:29, Jakub Kicinski wrote:
> On Mon, 29 Jun 2026 07:24:51 +0200 Jiri Slaby wrote:
>> And net-tools are broken by the uapi/linux/rose.h removal:
>>     rose.c:39:10: fatal error: linux/rose.h: No such file or directory
>> at:
>> https://github.com/ecki/net-tools/blob/2ab3c5efdb5c220bc9a649fded56c361136bff1a/lib/rose.c#L39
> 
> Looks like the code for rose is already well separated from the rest.
> Should we just ask net-tools to delete it? Or do you feel strongly
> about restoring the now-defunct header?

No strong opinion from me. net-tools are easy to fix.

The builds of LLVMs (versions 15 to 21 at least) are broken nonetheless. 
They are easy to fix as well -- by backporting the fix from main or 22. 
(15--21 are likely unmaintained upstream already, but still 
used/required widely).

$ osc whatdependson openSUSE:Factory llvm19 standard x86_64
llvm19 :
       MozillaThunderbird
       firefox-esr
       ghc
       gtkd
       ldc
       lfortran
       python-PyMuPDF
       redumper
       tilix
       zig0.14

$ osc whatdependson openSUSE:Factory llvm21 standard x86_64
llvm21 :
       OpenImageDenoise
       chromium
       embree
       ispc
       leechcraft
       python-PyMuPDF
       python314
       python314:base
       python314:doc
       python315
       python315:base
       python315:doc
       rpcs3
       rust-keylime
       zig0.16


thanks,
-- 
js
suse labs

