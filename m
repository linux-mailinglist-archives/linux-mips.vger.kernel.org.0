Return-Path: <linux-mips+bounces-15339-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EZhJLtHxQmqyJQoAu9opvQ
	(envelope-from <linux-mips+bounces-15339-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 30 Jun 2026 00:29:37 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E826DF080
	for <lists+linux-mips@lfdr.de>; Tue, 30 Jun 2026 00:29:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ZAxJNYJX;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15339-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15339-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93DF3301158B
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 22:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 279623A6F19;
	Mon, 29 Jun 2026 22:29:35 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AAFC253B42;
	Mon, 29 Jun 2026 22:29:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782772175; cv=none; b=BDGJFyZdCbo3tZu0G147Un2yHDnIGM0clTVbwidxRpIRSOdSEE6R1XcIA74kvVTgMJ8lFbTLHA9PI3JvQSCKXr7EnP9Jqmr1OYMzeYiRlX5afw4sg0COaUvGTaVpaKeSy6mKKOqGqsBg48edsdApz6vUgjBFgqM9bVDxMEXLYfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782772175; c=relaxed/simple;
	bh=qy9IqYhxXGKd5+INDu43oHcD21WBEQTtF4OGoGLHMcU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iliBd6Df/shVSltOtsh8Gafy6kZuGOmpb8IsZn/DbNeHRjq7CFUyDldI3TYMUEwd3GznGt3Z+bkE2b4iD9akwW4MMSXzwWcU+t4WHY4FGmN2P4+bODV1CXhAaFNuKd0aOYVbcKzw6gQOhN/Gfg6er83C9ThaL2D3ayH8DVCgLlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZAxJNYJX; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96FF81F000E9;
	Mon, 29 Jun 2026 22:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782772173;
	bh=BNvTIvo405RKspjZMPp+9avnaKrNvmNbScCG2di6J6s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ZAxJNYJXtwhOSa5pxtT0ze8Ib8SG83A1gbK3Iz8/VE+oKhN3ZVrwMkQbtarYV0WP/
	 g0tivZDwOd2Pv+i7ees0T0yrzOZTzgRMJE5Ye5supcXnFDayEic3pOBU32NKkMeIvi
	 Rf6NJjjv14yPkD13Kga9Ow7e8deyJDYUGgFND1ItMDAcfC3bR8aU42hYoDDNIl5O3k
	 r+ua2Wj+1zZYFzTKbznYAdHz+aUE6Vsjy4myC/Ks+f/AKsywl1C/W5fXkq0R6rMkw7
	 sF+EaPpsGL3fYKeD8m26wLxl+Gg+YTg7fT7n6KKllIuseBwp9eCZ02DT+4PNi7VNKW
	 IhZ+RK1W4pw2Q==
Date: Mon, 29 Jun 2026 15:29:30 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jiri Slaby <jirislaby@kernel.org>
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
Subject: Re: [PATCH net-deletions] net: remove ax25 and amateur radio
 (hamradio) subsystem
Message-ID: <20260629152930.4c2131ed@kernel.org>
In-Reply-To: <8458cf47-43f3-4328-bc6a-9aac31f1acf4@kernel.org>
References: <20260421021824.1293976-1-kuba@kernel.org>
	<0883a8e0-e8b4-4f22-bfc6-dd4a0fcf8b7a@kernel.org>
	<8458cf47-43f3-4328-bc6a-9aac31f1acf4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15339-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[kuba@kernel.org,linux-mips@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[46];
	FORGED_RECIPIENTS(0.00)[m:jirislaby@kernel.org,m:davem@davemloft.net,m:netdev@vger.kernel.org,m:edumazet@google.com,m:pabeni@redhat.com,m:andrew+netdev@lunn.ch,m:horms@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:federico.vaga@vaga.pv.it,m:carlos.bilbao@kernel.org,m:avadhut.naik@amd.com,m:alexs@kernel.org,m:si.yanteng@linux.dev,m:dzm91@hust.edu.cn,m:2023002089@link.tyut.edu.cn,m:tsbogend@alpha.franken.de,m:dsahern@kernel.org,m:jani.nikula@intel.com,m:mchehab+huawei@kernel.org,m:gregkh@linuxfoundation.org,m:tytso@mit.edu,m:herbert@gondor.apana.org.au,m:ebiggers@kernel.org,m:johannes.berg@intel.com,m:geert@linux-m68k.org,m:pablo@netfilter.org,m:tglx@kernel.org,m:mashiro.chen@mailbox.org,m:mingo@kernel.org,m:dqfext@gmail.com,m:jreuter@yaina.de,m:sdf@fomichev.me,m:pkshih@realtek.com,m:enelsonmoore@gmail.com,m:mkl@pengutronix.de,m:toke@toke.dk,m:kees@kernel.org,m:crossd@gmail.com,m:jlayton@kernel.org,m:wangliang74@huawei.com,m:aha310510@gmail.com,m:takamitz@amazon.co.jp,m:ku
 niyu@google.com,m:linux-doc@vger.kernel.org,m:linux-mips@vger.kernel.org,m:andrew@lunn.ch,m:mchehab@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[davemloft.net,vger.kernel.org,google.com,redhat.com,lunn.ch,kernel.org,lwn.net,linuxfoundation.org,vaga.pv.it,amd.com,linux.dev,hust.edu.cn,link.tyut.edu.cn,alpha.franken.de,intel.com,mit.edu,gondor.apana.org.au,linux-m68k.org,netfilter.org,mailbox.org,gmail.com,yaina.de,fomichev.me,realtek.com,pengutronix.de,toke.dk,huawei.com,amazon.co.jp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,netdev,huawei];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F3E826DF080

On Mon, 29 Jun 2026 07:24:51 +0200 Jiri Slaby wrote:
> And net-tools are broken by the uapi/linux/rose.h removal:
>    rose.c:39:10: fatal error: linux/rose.h: No such file or directory
> at:
> https://github.com/ecki/net-tools/blob/2ab3c5efdb5c220bc9a649fded56c361136bff1a/lib/rose.c#L39

Looks like the code for rose is already well separated from the rest.
Should we just ask net-tools to delete it? Or do you feel strongly
about restoring the now-defunct header?

