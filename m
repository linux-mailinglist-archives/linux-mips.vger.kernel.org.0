Return-Path: <linux-mips+bounces-14239-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGYEOzqI6WnccQIAu9opvQ
	(envelope-from <linux-mips+bounces-14239-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 23 Apr 2026 04:47:22 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CDC44C5A6
	for <lists+linux-mips@lfdr.de>; Thu, 23 Apr 2026 04:47:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 57F0D300D694
	for <lists+linux-mips@lfdr.de>; Thu, 23 Apr 2026 02:45:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4E6031A572;
	Thu, 23 Apr 2026 02:45:28 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.redfish-solutions.com (mail.redfish-solutions.com [50.20.195.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3036E30E857;
	Thu, 23 Apr 2026 02:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=50.20.195.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776912328; cv=none; b=L2QOJso66XvMdnCOH2E17mVJHYxhmXtd+pbl336Aw8Aqsi2ndtku0sTKVzGQOnMqb7JWH588zj1b3jkz8HtTJup7cZJ7/1aeGJw89YdASPQU1F994ZXmR9Fj4DrEum4rBjKwcouaC/Dya5ofuCrqZnQCdNgWMvcXrZTpyOu6TwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776912328; c=relaxed/simple;
	bh=ncskTVHsX9Hfe2ImeJP3V0bXdObuDuc46kCl383gQnk=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=ZO/cD9uA1rz6BnzNAqm+S4ck6tgkEMpijv8rIdHtVreMUWWYrFPSeJG0wUCtxWR52FCYc4AMfwtEurr+vzL6AnTgMR3u1kOBAcMbTDPX3amyzWjkxGnk5vieTSMNOBbGaiu38hnlo6myIt+WZG7dbKl8oXYc2jKUrMxLm0glE0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=redfish-solutions.com; spf=pass smtp.mailfrom=redfish-solutions.com; arc=none smtp.client-ip=50.20.195.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=redfish-solutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redfish-solutions.com
Received: from smtpclient.apple (macbook4.redfish-solutions.com [192.168.3.6])
	(authenticated bits=0)
	by mail.redfish-solutions.com (8.18.1/8.18.1) with ESMTPSA id 63N2fckv405223
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Apr 2026 20:41:38 -0600
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.500.181\))
Subject: Re: [PATCH net-deletions v2] net: remove unused ATM protocols and
 legacy ATM device drivers
From: Philip Prindeville <philipp_subx@redfish-solutions.com>
In-Reply-To: <accbbcdf0ec14ae4d3f21ef5da7091bdcbd6574f.camel@infradead.org>
Date: Wed, 22 Apr 2026 20:41:27 -0600
Cc: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net,
        openwrt-devel <openwrt-devel@lists.openwrt.org>,
        Guy Ellis <guy@traverse.com.au>, netdev@vger.kernel.org,
        edumazet@google.com, pabeni@redhat.com, andrew+netdev@lunn.ch,
        horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
        linux@armlinux.org.uk, tsbogend@alpha.franken.de, maddy@linux.ibm.com,
        mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org,
        3chas3@gmail.com, razor@blackwall.org, idosch@nvidia.com,
        jani.nikula@intel.com, mchehab+huawei@kernel.org, tytso@mit.edu,
        herbert@gondor.apana.org.au, geert@linux-m68k.org, ebiggers@kernel.org,
        johannes.berg@intel.com, jonathan.cameron@huawei.com, kees@kernel.org,
        kuniyu@google.com, fourier.thomas@gmail.com,
        andriy.shevchenko@intel.com, rdunlap@infradead.org,
        akpm@linux-foundation.org, linux-doc@vger.kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        bridge@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <68316F0B-2442-4492-A041-E57EFC58AC08@redfish-solutions.com>
References: <20260422041846.2035118-1-kuba@kernel.org>
 <accbbcdf0ec14ae4d3f21ef5da7091bdcbd6574f.camel@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
X-Mailer: Apple Mail (2.3864.500.181)
X-Scanned-By: MIMEDefang 3.6 on 192.168.4.49
X-Spamd-Result: default: False [2.04 / 15.00];
	DMARC_POLICY_REJECT(2.00)[redfish-solutions.com : SPF not aligned (relaxed), No valid DKIM,reject];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14239-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,davemloft.net,lists.openwrt.org,traverse.com.au,vger.kernel.org,google.com,redhat.com,lunn.ch,lwn.net,linuxfoundation.org,armlinux.org.uk,alpha.franken.de,linux.ibm.com,ellerman.id.au,gmail.com,blackwall.org,nvidia.com,intel.com,mit.edu,gondor.apana.org.au,linux-m68k.org,huawei.com,infradead.org,linux-foundation.org,lists.ozlabs.org,lists.linux.dev];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[39];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[philipp_subx@redfish-solutions.com,linux-mips@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	APPLE_MAILER_COMMON(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,netdev,huawei];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,openwrt.org:url]
X-Rspamd-Queue-Id: 59CDC44C5A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



> On Apr 22, 2026, at 7:05=E2=80=AFAM, David Woodhouse =
<dwmw2@infradead.org> wrote:
>=20
> On Tue, 2026-04-21 at 21:18 -0700, Jakub Kicinski wrote:
>>=20
>>    I'm still deleting the solos driver, chances are nobody uses it.
>>    Easy enough to revert back in since core is still around.
>>    The guiding principle is to keep USB modems and delete
>>    the rest as USB ADSL2+ CPEs were most popular historically.
>=20
> Still not entirely convinced; I worked on both USB ATM modems and on
> Solos, and the Solos is both the most modern and the only one I still
> actually have. And the only one we have native support for that could
> ever do full 24Mb/s ADSL2+, I believe.
>=20
> If we drop it, OpenWrt will need to drop support for these, which I
> think were quite popular at the time; there were a few UK resellers:
> https://openwrt.org/toh/traverse/geos1_1
>=20
> I still don't actually care *enough* to try to find an ADSL line I
> could plug one into for testing though... :)


I have 3 boards lying around if anyone wants them.




