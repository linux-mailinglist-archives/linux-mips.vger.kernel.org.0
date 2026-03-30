Return-Path: <linux-mips+bounces-13985-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJ6zMfEPymmS4wUAu9opvQ
	(envelope-from <linux-mips+bounces-13985-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2026 07:53:53 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EF8355C1D
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2026 07:53:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 191FA3039EE3
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2026 05:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A30A8391512;
	Mon, 30 Mar 2026 05:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dominikbrodowski.net header.i=@dominikbrodowski.net header.b="fsIErtyD"
X-Original-To: linux-mips@vger.kernel.org
Received: from isilmar-4.linta.de (isilmar-4.linta.de [136.243.71.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538CC3806DD;
	Mon, 30 Mar 2026 05:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.243.71.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774849931; cv=none; b=sEJf8OH8Xolrxgft5v7Jq1eW8siL/8LMFR6wlMlk5v8yAxIiKlGjQu5E1zIWMAV05QGVmB5JKhwSic/NcACsEVaJ3Ayyb3igm4CMGXMm8TFgCxiXyOuWBqhDviLt3CQTOHGmkl1o1/pMP6JsTDjWOr1QxtfFWqmuQ/tLXrlsb6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774849931; c=relaxed/simple;
	bh=1m88r840INzIcH2pj8XvaABPCX13j1DDWTGhjNl7Gog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ux5XanQRDDzhOApu9X/1MIbr9AWpInKMyW75yZP7h9mN3t3AY3M1uxlO7hMq/1KkrAw/CNMBKkH+z3+Tw9BolYPyTbFL7DLN4BavaBvV3LqhdTMTcZRgh27OkX+h+4KI5ni82o/mTvNmm3Oj28xaI/RsLuIMNhtYBa0hv/haPGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dominikbrodowski.net; spf=pass smtp.mailfrom=dominikbrodowski.net; dkim=pass (2048-bit key) header.d=dominikbrodowski.net header.i=@dominikbrodowski.net header.b=fsIErtyD; arc=none smtp.client-ip=136.243.71.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dominikbrodowski.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dominikbrodowski.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dominikbrodowski.net;
	s=k26.isilmar-4; t=1774849537;
	bh=1m88r840INzIcH2pj8XvaABPCX13j1DDWTGhjNl7Gog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fsIErtyDD5IVOcOS5wJrHk4Y3VU2X5APP1No6EjOb3S5QEKGgGTycNP7B+q1BFwzm
	 nbBEljmS6/TdEOD5khY3T8QWuGoybqspqv5VNa/AL7gCVoJt/Y47Hnc3GmQ0fVnNCN
	 CTRD2c0OqfiUZqxJ0cFHi/f/2fwSD57kEryqc0TEtwBF4yF9slqzuhKTF/G4W0TJb3
	 9+j4+l21b8Fj/j5SE7qHZ6hMEm0kSMEdtkA8+XQPqJ+IxAH/4LMMcKYRTgvX1F3sl3
	 Nyaz5uR8/XFM67s+zqKq4yFZpD6Fd2RSGGZarjprO6KcZHrYwXvdtx5oOeYsFuE76p
	 xcRZi2cEMq6pQ==
Received: from shine.dominikbrodowski.net (brodo.linta [10.2.0.112])
	by isilmar-4.linta.de (Postfix) with ESMTPSA id D6F0F200690;
	Mon, 30 Mar 2026 05:45:36 +0000 (UTC)
Received: by shine.dominikbrodowski.net (Postfix, from userid 1000)
	id DDBE8A00B8; Mon, 30 Mar 2026 07:45:28 +0200 (CEST)
Date: Mon, 30 Mar 2026 07:45:28 +0200
From: Dominik Brodowski <linux@dominikbrodowski.net>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-pci@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
	Eric Biggers <ebiggers@google.com>, Simon Horman <horms@kernel.org>,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] drivers: pcmcia: remove obsolete host controller drivers
Message-ID: <acoN-BnAHBv73PcT@shine.dominikbrodowski.net>
References: <20260309074226.25937-1-enelsonmoore@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309074226.25937-1-enelsonmoore@gmail.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[dominikbrodowski.net:s=k26.isilmar-4];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,alpha.franken.de,linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,google.com,mit.edu];
	TAGGED_FROM(0.00)[bounces-13985-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[dominikbrodowski.net];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[dominikbrodowski.net:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@dominikbrodowski.net,linux-mips@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 40EF8355C1D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Am Mon, Mar 09, 2026 at 12:41:48AM -0700 schrieb Ethan Nelson-Moore:
> PCMCIA is almost completely obsolete (the last computers supporting it
> natively were from ~2009), and the general consensus [1] seems to be
> that support for it should be gradually removed from the kernel.
> 
> In 2023, an initial step of removing all the PCMCIA char drivers was
> taken in commit 9b12f050c76f ("char: pcmcia: remove all the drivers"),
> and that has not been reverted, so it seems logical to continue this
> process by removing more low-hanging fruit.
> 
> These host controller drivers have had no meaningful changes since
> their status was discussed in 2022 [2], and are unlikely to have any
> remaining users. Remove them and a couple references to them
> in comments.
> 
> The i82365 and tcic drivers are for ISA-attached host controllers,
> which are even less likely to be used nowadays than ones on other buses.
> 
> The i82092 driver has almost certainly not been used in over 20 years.
> It was broken by a null pointer dereference since the dawn of Git
> history (2.6.12-rc2 in 2005) until someone fixed it in 2021 in commit
> e39cdacf2f66 ("pcmcia: i82092: fix a null pointer dereference bug").
> From their dmesg log [3], it is clear they were testing in an emulated
> environment and not on real hardware.
> 
> i82365.h is used by drivers other than i82365 and is therefore retained.
> 
> [1] https://lore.kernel.org/all/c5b39544-a4fb-4796-a046-0b9be9853787@app.fastmail.com/
> [2] https://lore.kernel.org/all/Y07d7rMvd5++85BJ@owl.dominikbrodowski.net/
> [3] https://lore.kernel.org/all/1624345891-4215-1-git-send-email-zheyuma97@gmail.com/
> 
> Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>

Applied to pcmcia-next.

Thanks,
	Dominik

