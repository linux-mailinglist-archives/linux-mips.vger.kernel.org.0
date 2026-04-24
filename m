Return-Path: <linux-mips+bounces-14306-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPyOBq1G62kmKgAAu9opvQ
	(envelope-from <linux-mips+bounces-14306-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 24 Apr 2026 12:32:13 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8C945D1A1
	for <lists+linux-mips@lfdr.de>; Fri, 24 Apr 2026 12:32:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26FD73020A42
	for <lists+linux-mips@lfdr.de>; Fri, 24 Apr 2026 10:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E48C7366558;
	Fri, 24 Apr 2026 10:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H4Z/1M55"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF11B364E9C;
	Fri, 24 Apr 2026 10:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777026538; cv=none; b=ObFR0+XIgz5BM6zTgMU78BBRn49MsEAq73TrZddS1axPlreeglozLP/98umEIG+0gzjPLO3Ua49HhF+uY4sLngXUn5iTw6YKMpI2r+krpAHBTPPzYhZkcHnpswTYRNXQuBYq54rOzJWSL+2ivEFxw/ckXbLEXZlbjkdKSAMnGfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777026538; c=relaxed/simple;
	bh=bg9oJZjssjl8PSO+dx5xJ3p5/zle9VIUhCA1mWT3A/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qu86sygNZyB/afISVffcBAn0Sy+RmFmnrlNFoLbNLyylhs8XCc1NZwbx4kiR8djWv5IXd2ljT/GoPGw9V0edwdLwNZfsODRlQkJOBD8DJBu6YZ2HpfIOThyFz3TYy2zTWnvBO/+7/VTpkt1CPM+5Y2PprLAJWjjt37CrYPOW8g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H4Z/1M55; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84146C2BCB6;
	Fri, 24 Apr 2026 10:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777026538;
	bh=bg9oJZjssjl8PSO+dx5xJ3p5/zle9VIUhCA1mWT3A/Y=;
	h=From:To:Cc:Subject:Date:From;
	b=H4Z/1M55f68XcqrcbJAp1N5aaLx1+ub8CTTB8Z/P5L/g7zqrwfh78pIj1X7MHbFFk
	 Rr07JR2Hx8bx52sJQgFw+gYJcinEPLoQQ5l+UivXpcWT+RJ02J7y3TvnxAQks+/XLC
	 QEPS+tJKlz+eMLHgH1RI60bKHxgLQ+CpMT//2rTf82cY5n1iewVvvdGGToUZRqh+Q7
	 iZkkVX+ErKff5aAipdnVuJ7w9we5rdPrND1VjQGAxJTgLcJhky0Z5y+jLivCM6K8uc
	 IgqWtGO0LzGyyHekeWU6rolbLfmDhklU/D/uSEAhJC3d76hXFkx3ukqnUqHRLdo/Rn
	 bsMggAtkACy3w==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wGDmK-0000000AyYS-1e0C;
	Fri, 24 Apr 2026 12:28:56 +0200
From: Johan Hovold <johan@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/5] MIPS: ip22-gio: fix leaks and replace static root
Date: Fri, 24 Apr 2026 12:28:44 +0200
Message-ID: <20260424102849.2616035-1-johan@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: DD8C945D1A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14306-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-mips@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

This series fixes some issues found through inspection when looking into
replacing the statically allocated gio bus root device.

Johan


Johan Hovold (5):
  MIPS: ip22-gio: fix kfree() of static object
  MIPS: ip22-gio: fix gio device memory leak
  MIPS: ip22-gio: fix device reference leak in probe
  MIPS: ip22-gio: switch to dynamic root device
  MIPS: ip22-gio: do not export device release function

 arch/mips/include/asm/gio_device.h |  6 ------
 arch/mips/sgi-ip22/ip22-gio.c      | 34 ++++++++++--------------------
 2 files changed, 11 insertions(+), 29 deletions(-)

-- 
2.53.0


