Return-Path: <linux-mips+bounces-14011-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NA0A/J8zmnBnwYAu9opvQ
	(envelope-from <linux-mips+bounces-14011-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 02 Apr 2026 16:28:02 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BF838A80A
	for <lists+linux-mips@lfdr.de>; Thu, 02 Apr 2026 16:28:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7856D303B7DB
	for <lists+linux-mips@lfdr.de>; Thu,  2 Apr 2026 14:20:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 084C93E122B;
	Thu,  2 Apr 2026 14:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fWrv5yfR"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E9838AC91;
	Thu,  2 Apr 2026 14:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775139637; cv=none; b=o+kn1xNcWqvVQ93QyQFyLHn/ErbKlQ32WQSKgDrWo5U4lQ8JXXvkNGCbe85Yk4KuitYhVMCWAK9O0gHz2S2pVFmjAt0t5+RkGyOChRXhs9cBAh1J2XJ4hLt9X4hE7YiFjcY+a26nM7EobNxBvL/y5Bb00mYV4keinFPbAahwxp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775139637; c=relaxed/simple;
	bh=bv7RCxtESKoJrm7EMshLn4TSGfPnsNBCL8dTRRN0CCY=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=oLrf6/A0k1JQa/NHPRcQCgYl2LtWLWALavqkSBXGeLv0gmNZMkG6bxCPDYQmkjUz0k4lG4B6irmYSZpq4ab3j7/z7mYNzzi8OhKXZGQdKu6oXWCtG4gPlqJmRwF4DdZyslp+nxQZJq3G05rBeIKcabPiYsv7TXK7R8bZoTDXUR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fWrv5yfR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E679C116C6;
	Thu,  2 Apr 2026 14:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775139637;
	bh=bv7RCxtESKoJrm7EMshLn4TSGfPnsNBCL8dTRRN0CCY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=fWrv5yfRzE4/ZjR6Wfg/SjQPCMkMLGkdN4cT6/P8xpVeIe2+BQcgbZJcExBCzyPBq
	 qO/kXJLrEebC+P70ynkMS0KEqzeesvcHiXkkNZKDN1GmsBAjTEgTtdVMBGeUn/FrUa
	 sNsWy93MuRD4n6hBpVAnG548IrVuXBBOSSWdkdGjpd06zKH4ZXOjvlhq3v/P1IjZAq
	 sNIWSyZkZnfByAqnkS62IgrmAU1VN9bpOMPVzdKJr4QeqnhDIqTLFjVm7H3dwQ/gG8
	 nyLTkNONia6wtrqLQuTk9sJeTOc5mrVw94Pfe055+KyYrpVlHSQpqu4d0g+YzM9S+L
	 VEpdFgLXJwaUQ==
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/3] checksyscalls: only run when necessary
From: Nicolas Schier <nsc@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Linux-Arch <linux-arch@vger.kernel.org>, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-kbuild@vger.kernel.org
In-Reply-To: <604e8db2-6745-48b1-9db7-29fe12eb9579@app.fastmail.com>
References: <20260324-kbuild-missing-syscalls-v2-0-651b8beb0bfd@weissschuh.net>
 <604e8db2-6745-48b1-9db7-29fe12eb9579@app.fastmail.com>
Date: Thu, 02 Apr 2026 16:18:37 +0200
Message-Id: <177513951750.3276215.16717514166906807973.b4-reply@b4>
X-Mailer: b4 0.16-dev-ad80c
X-Developer-Signature: v=1; a=openpgp-sha256; l=499; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=bv7RCxtESKoJrm7EMshLn4TSGfPnsNBCL8dTRRN0CCY=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBpznq9vN754OGxXxvK/x7iFeMLRx6ueUw0ft/4H
 BexypZMMuqJAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCac56vQAKCRAHUgpwFiYS
 af94D/oDAfVi69NhvMrGBUFQn57xzTJgb7j/KeaBCsjHAwcXYuvJVe6iVxh38f1U1jcl0U4x32H
 U+AA3FwTA9/OBjmpN15UTZZVU0z8nfkZr2jhofoXx3Y9AkkFj0KlOedTGHKG2FS9+8XpJzZWSvj
 X8OPxmf0QbRyXQ8jTBdbT0G56727ZCbxgIG4hDDxGDwG/gPGD0GMmf/8/PWETSEKNEWRPKedkPE
 4k/tLFOIiqjccTL0ZGBdhXnxjeKc3ueAaSHpgRweFo6czPSMtrg6zU1m+Q7FGAkoHneiR/s9wx2
 nRFNQppsbOtiFbXX63JVmbBWFzA45Aiujm64ApKvuL07KNFP1nPzUZMTZwZBL5tV29JvDQsK8gJ
 RePxaXGfA5Lwhrchi9ywFDw9cZ49NJODfG+Z4wvWV45F2oKs9o+OHljr4YOZxFMchGUEHbfYauQ
 eCxnE10oWuKM8hfSyRVatDjhbrxs57CFojQNJJDxVBwu0UqpWi44av6jRUfmPclE1J1nXgEyuT9
 6RI1bEFqo2Rn+AmeaQSUgS+qeWq00oJ83Nc+FX6bskkfCXe9vSUhYejpFHHrsOxXNEMZG27wlyy
 bfl6uiReZ5iDlg6Wjc9i3G4/Qnna7frj8wWNvPNOWwIpECMiKdKAcnAX/kGqUvfKqMJuPhVBINP
 kKZXmxmVm/8kuSg==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14011-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-mips];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 51BF838A80A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-03-24 18:29:13+01:00, Arnd Bergmann wrote:
> On Tue, Mar 24, 2026, at 18:16, Thomas Weißschuh wrote:
> 
> > Currently checksyscalls.sh is unconditionally executed during each build.
> > Most of these executions are unnecessary.
> >
> > Only run checksyscalls.sh if one of its inputs have changed.
> >
> > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> 
> Nice series!
> 

yes, nice series with good ideas.  Thanks!


Reviewed-by: Nicolas Schier <nsc@kernel.org>


