Return-Path: <linux-mips+bounces-15171-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rJu/GvSKOmrN/QcAu9opvQ
	(envelope-from <linux-mips+bounces-15171-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 23 Jun 2026 15:32:36 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CD86B7778
	for <lists+linux-mips@lfdr.de>; Tue, 23 Jun 2026 15:32:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbaby.net header.s=bambino header.b=Dn0B2vpG;
	dkim=pass header.d=aosc.io header.s=default header.b=rmDiYIyX;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15171-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-mips+bounces-15171-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=aosc.io;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B18833045303
	for <lists+linux-mips@lfdr.de>; Tue, 23 Jun 2026 13:32:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32693379EEF;
	Tue, 23 Jun 2026 13:32:21 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from relay1-n.mailbaby.net (relay1-n.mailbaby.net [206.72.200.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC3C24A067
	for <linux-mips@vger.kernel.org>; Tue, 23 Jun 2026 13:32:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782221541; cv=none; b=DiZBHdWF9lhHpQcPIBlLuJMeAASp2ADAFpxU8d2eArIKbY1vEyLjZ0tkZm+eVIF7/FyqY63oc7OghICwrN+tRNkOnIBcd/p0+aWfHGqAEv3uULYLVHDQaXPrNLg95RcFCdQDydk06h2g/uRuoaHwG9XrwepcqSykH9yBc12di/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782221541; c=relaxed/simple;
	bh=ewT7c/ucE3HyqLQvAkHSu8tYzFPBZu7CLpbsCzCZWjY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QX4lKJDhiXLqK9h6Eue4UTvWTMGXFAX55CGhKocEQ6o8TvRFLSv/677tCEUwCf0L/kbSSOSPxo/U4r9v2+Bmfw7pe89ZEBhVxy/DSC730jcSbTjw0yz8bujCYcgUYKIOn6kfrHvng6z6NbL7EYA2kk/WXJgpa0bLhE1kxU8mOQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aosc.io; spf=pass smtp.mailfrom=aosc.io; dkim=pass (1024-bit key) header.d=mailbaby.net header.i=@mailbaby.net header.b=Dn0B2vpG; dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b=rmDiYIyX; arc=none smtp.client-ip=206.72.200.45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbaby.net;
 q=dns/txt; s=bambino; bh=ewT7c/ucE3HyqLQvAkHSu8tYzFPBZu7CLpbsCzCZWjY=;
 h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=Dn0B2vpGEakIpmmSAqLm/gcYV8T+LMHvtg/wtgnyC6VCbqgDw+O7A01d0g86HaBZxd3mMSm8u
 C50/pv9yXKzu2zuAzthHOVoNWhdetdcXB+OwHfpKq/VXpVF8YMsRWDTa8xokRYNrWRE56a043sN
 U3kjtsy9TXl0Z7RVe62WOLc=
Received: from mb-nj-kvm1.internal (mb-nj-kvm1.internal [10.10.2.10])
 (Authenticated sender: mb86144)
 by relay1-n.mailbaby.net (MailBabyMTA) with ESMTPSA id 19ef4a9aeba0005606.002
 for <linux-mips@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 23 Jun 2026 13:27:01 +0000
X-Zone-Loop: 6a2d91075e7153e39cadf46a0643a842a4fe12e36f95
X-MB-ID: mb86144
X-SPF: pass
Feedback-ID: mb86144:19ef4a:587f4d465843594778405947455d:mbaby
X-MAILBABY-ORIGIN: PASS
Received: from relay2.mymailcheap.com (relay2.mymailcheap.com [151.80.165.199])
	by relay5.mymailcheap.com (Postfix) with ESMTPS id CF6FA200BD;
	Tue, 23 Jun 2026 13:26:52 +0000 (UTC)
Received: from nf2.mymailcheap.com (nf2.mymailcheap.com [54.39.180.165])
	by relay2.mymailcheap.com (Postfix) with ESMTPS id A42D13E877;
	Tue, 23 Jun 2026 13:26:44 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf2.mymailcheap.com (Postfix) with ESMTPSA id BBF3B4007A;
	Tue, 23 Jun 2026 13:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1782221202; bh=ewT7c/ucE3HyqLQvAkHSu8tYzFPBZu7CLpbsCzCZWjY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rmDiYIyXIW7GA8TB0cSGFZkzUPuInP0t/D3ytkXCDhfkJQaLWTiX7RfnhYQbAwFgy
	 FIErx9OD2nsWfZMT3F5SqSnhMNvpUaZo0C9YsaZmOkkR4K5M/BTgL/K5kN4nKg7sII
	 rzGayiuXaN9QD43mX6aAQHvfdZDliog5w2/1OSYg=
Received: from avenger-XINGYAO-Series.tail8e8410.ts.net (unknown [111.202.72.166])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id E153B40153;
	Tue, 23 Jun 2026 13:26:38 +0000 (UTC)
From: WangYuli <wangyuli@aosc.io>
To: macro@orcam.me.uk
Cc: guanwentao@uniontech.com,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	niecheng1@uniontech.com,
	tsbogend@alpha.franken.de,
	wangyuli@uniontech.com,
	zhanjun@uniontech.com
Subject: Re: Gentle ping: [PATCH v2 0/6] MIPS: Resolve build problems on decstation_64
Date: Tue, 23 Jun 2026 21:26:31 +0800
Message-ID: <20260623132631.480565-1-wangyuli@aosc.io>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <alpine.DEB.2.21.2507071545400.56608@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2507071545400.56608@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[aosc.io,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[mailbaby.net:s=bambino,aosc.io:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[mailbaby.net:+,aosc.io:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:macro@orcam.me.uk,m:guanwentao@uniontech.com,m:linux-kernel@vger.kernel.org,m:linux-mips@vger.kernel.org,m:niecheng1@uniontech.com,m:tsbogend@alpha.franken.de,m:wangyuli@uniontech.com,m:zhanjun@uniontech.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[wangyuli@aosc.io,linux-mips@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-15171-lists,linux-mips=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangyuli@aosc.io,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mailbaby.net:dkim,vger.kernel.org:from_smtp,aosc.io:dkim,aosc.io:mid,aosc.io:from_mime];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B4CD86B7778

Hi Maciej,

I happened to notice that part of this patch series appears to have made
its way upstream via a separate submission, with you listed as the
author, and has since been picked up by Thomas.

Link: https://lore.kernel.org/all/ahWx0vtGim1VlHc7@alpha.franken.de/

That was, I have to say, a rather unexpected way for those patches to
make progress. Since you have already found time to handle that part of
the series, I would be grateful if you could also review the remaining
patches, which fix the build failures triggered by using clang together
with -Werror.

Best regards,

--
WangYuli

