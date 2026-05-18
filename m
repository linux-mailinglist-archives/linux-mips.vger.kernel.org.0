Return-Path: <linux-mips+bounces-14626-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HhKGdOWCmry3wQAu9opvQ
	(envelope-from <linux-mips+bounces-14626-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 18 May 2026 06:34:27 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D03C4565B05
	for <lists+linux-mips@lfdr.de>; Mon, 18 May 2026 06:34:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 77FD83006B4E
	for <lists+linux-mips@lfdr.de>; Mon, 18 May 2026 04:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84B5D38239E;
	Mon, 18 May 2026 04:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=openadk.org header.i=@openadk.org header.b="VmntXl6X"
X-Original-To: linux-mips@vger.kernel.org
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A56A382296
	for <linux-mips@vger.kernel.org>; Mon, 18 May 2026 04:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.238.66.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779078845; cv=none; b=cgghIUvEHaGk01cw0e1Y9e3xzXAwD+uIvk5lVGAR4kL7H3ciPD1ru2LTL9A0MuksKM0Rp67U7OtqBiaXB1quN9fK9d1Xzrcr69S0+BFT9wf5kVOcA0kf+4lfJfUbF5p0TIXYcNwZYTAIpRI6Zqo0EcX9ZTxmwJ7OFdF/DS1EGQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779078845; c=relaxed/simple;
	bh=9bWBVkGCRf0NhP3vwPVHi1/1YGyiF6b6QotAuU/9I8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZqnZilfeXCvwV6SGh/OE+7DOhXtG7EetcPwJPnJpGhnAaisx7+5QhW/rr7KeKg6kO387LtkVQtByoklkYusceSIPy6QQUUIE0cNHhyiU9CzL9TVpQrHlF9e7CKnhAoIijyK6DMMVoRqYFgiU6HLTffnlPdzP0+8MDm9ar1QkaOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openadk.org; spf=pass smtp.mailfrom=openadk.org; dkim=fail (0-bit key) header.d=openadk.org header.i=@openadk.org header.b=VmntXl6X reason="key not found in DNS"; arc=none smtp.client-ip=89.238.66.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openadk.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openadk.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
	t=1779078839; bh=9bWBVkGCRf0NhP3vwPVHi1/1YGyiF6b6QotAuU/9I8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VmntXl6Xe34W0pyEirAderURkLRvOCzMrcEFj7nZ7RvS97ZKHi5HSg6uO1dTH9ulp
	 XXebmgIY1k04IVUnX3eZ+vmlhfSeVfmb250A70ofn17xuKzg+/JlutrRr89tb3UFiN
	 CmQGHo2EWmdRee65N5tMymj3AEk/2yiJBD+ozfplBH4GbFWYRiLMb1h+Q8VO1u++XV
	 7/SnZER8Dm/tGIEZvaDPV0PQyTWISU4kzi7jIQae9SCOL6COVb/43GexrN0ddwHcGc
	 14bxDZDUpZ7HWSrPwgCPI62Mc2Dv/uXDf9JHc0xbgSjuc82OnGogoR5ekZZDu2kwe7
	 R7uTi555cPi5w==
Received: by helium.openadk.org (Postfix, from userid 1000)
	id 5F6BD31E0C80; Mon, 18 May 2026 06:33:59 +0200 (CEST)
Date: Mon, 18 May 2026 06:33:59 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Peter =?utf-8?Q?M=C3=BCnster?= <pm@a16n.net>
Cc: linux-mips@vger.kernel.org, Waldemar Brodkorb <wbx@openadk.org>
Subject: Re: Asus WL500g Premium (BCM47XX) problem
Message-ID: <agqWtz_66N5KkBv7@waldemar-brodkorb.de>
Mail-Followup-To: Peter =?utf-8?Q?M=C3=BCnster?= <pm@a16n.net>,
	linux-mips@vger.kernel.org, Waldemar Brodkorb <wbx@openadk.org>
References: <aZ3NVrKLKgsflL1H@waldemar-brodkorb.de>
 <aZ-Ldi2U-51z3tF5@waldemar-brodkorb.de>
 <87y0hhgbip.fsf@a16n.net>
 <agoFSZ8pdS_bt3C-@waldemar-brodkorb.de>
 <87cxytg5n7.fsf@a16n.net>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87cxytg5n7.fsf@a16n.net>
X-Operating-System: Linux 6.12.85+deb13-amd64 x86_64
X-Rspamd-Queue-Id: D03C4565B05
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[openadk.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14626-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[openadk.org:~];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wbx@openadk.org,linux-mips@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-0.335];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	R_DKIM_PERMFAIL(0.00)[openadk.org:s=2022];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,waldemar-brodkorb.de:mid]
X-Rspamd-Action: no action

Hi Peter,
Peter Münster wrote,

> On Sun, May 17 2026, Waldemar Brodkorb wrote:
> 
> > It is not integrated.
> 
> Is it planned? If not, what could I do please, to make it happen?

What device do you have?
Can you test the patch, maybe I can resend it. Last time
I got no response, so I thought nobody is interested in it.
 
> > You can find the patch which applies on latest 6.18 kernel here:
> 
> I get "Error: Forbidden"...

Ah, I forgot that I had disabled the Sourcebrowser for
unauthenticated users because of massive AI crawler attacks.

You can always clone my repo of FreeWRT to get the patch:
git clone https://git.freewrt.de/git/freewrt

best regards
 Waldemar

