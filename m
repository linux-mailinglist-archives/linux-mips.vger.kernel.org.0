Return-Path: <linux-mips+bounces-14018-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKTsNRfRzmmUqQYAu9opvQ
	(envelope-from <linux-mips+bounces-14018-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 02 Apr 2026 22:27:03 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 517C238DF53
	for <lists+linux-mips@lfdr.de>; Thu, 02 Apr 2026 22:27:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CF3C7306C465
	for <lists+linux-mips@lfdr.de>; Thu,  2 Apr 2026 20:22:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F32F0390980;
	Thu,  2 Apr 2026 20:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NbKXYSf6"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE542DCF57;
	Thu,  2 Apr 2026 20:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775161340; cv=none; b=pvBgU6UPYGpzURgh7o4AwkgD4g7YGLui3VwDLcd0hqRf2QPyn/amnaJMjeIGD1fCEtfm4UqBsQXVlR6wS322JS4LZJlwVJHzqcBQQ8EajAUmdU2s8By4fSRK4RV+P3UPR6TGu7UPbffjNG5ezxm1AWTh8CZJc2JVYngmHaB5Btw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775161340; c=relaxed/simple;
	bh=FkTwDWhRayTXO0erNRUzxsgYR1DUvin/r1s0inw7c3Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bLmP5L4OGD5HLyAjHqttJjySe86pnVLtBkmcudh7Z6lK1QoibmWvRpleogmXlxFs39TlE6w5puuqEiUkLWq1JTs8EWPym/o6ZkBEcn0YtXHHVcGIchKWPUFYun57frQE3TQmN7IJkFDjmMmCVpZFM22phjq+eQeKdHR//B9WLzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NbKXYSf6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 151F0C116C6;
	Thu,  2 Apr 2026 20:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775161340;
	bh=FkTwDWhRayTXO0erNRUzxsgYR1DUvin/r1s0inw7c3Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NbKXYSf60EXAiy9F0yCQdQZRdWWo+C1BuWK1c0YHZ7mO6gVYNHRBm6yGRC/+/V4ZM
	 3PKvV+WpVWG9HyEAN7LWHHgMlxwN6Imnnxv6EY5eUeWK29eZsWyPMcxynlwYZT2ZZk
	 oIGnOFbBXC/qzv3+P5EnJfHLixxWw8uGGfKeAxrcd7LhdhO2/kJQIiYGlX+fNKkQj/
	 25dDxAqfwNo8IiEU70SZk37ceQlBhSvS8NzeqHDAzfWkd1EI1KFS4pe7e6qvdzy4/b
	 PoQDQKo2Ti5qIvfyDAWE1hp69UimJAISHb5N3JpPYl91BD8hQ1OjKkRGdCh32UqCX9
	 fFyFuhrj806mg==
From: Nicolas Schier <nsc@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Nathan Chancellor <nathan@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-kbuild@vger.kernel.org
In-Reply-To: <20260402-kbuild-missing-syscalls-v3-0-6641be1de2db@weissschuh.net>
References: <20260402-kbuild-missing-syscalls-v3-0-6641be1de2db@weissschuh.net>
Subject: Re: [PATCH v3 0/3] checksyscalls: only run when necessary
Message-Id: <177516124052.3536083.11423413906699581332.b4-ty@b4>
Date: Thu, 02 Apr 2026 22:20:40 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1132; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=FkTwDWhRayTXO0erNRUzxsgYR1DUvin/r1s0inw7c3Q=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBpzs+dnZQ/1i/sr2dvs159EDsN7oXPf/x92Uga2
 DOwpgOWI+6JAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCac7PnQAKCRAHUgpwFiYS
 aZ6vD/wPsiuHFbX0hfK8qRZ6Nr/jdfshBn/AbH+RExFFCXOrCfGqS93bghGl7BzNBBMbOpl+4oQ
 NQXJX9o3ysNqfeX/4zwSytghT9GtIPHVySj+eTKU1MYAjDQVfzxCDc5DYfgPWzoCsPMds593xVG
 nUVmqdf4DZCGkvRw6uCp9vSoe3P5ui3PAtsbus+Zd0BMXXl4Re4j/dZ+oBIy1Yv7vw3VRTpBh9S
 q3mlYt3UkQJctqXiAGBrGreUd9uIrpbgVZQPTSKrpecYqEIA5tAVs9KMnLhMsJbKH7bqa2bi8Mk
 xB2no+EUFUBjxeqwugl4Irrg/bCouDYg/tJr5jpT8zUGqyYS6nRZvkvaV5gnd2SPXgeH8Fme9hP
 PeVHyqFxtSwX+i2mERIx+Ae5ipBpolRFUiV7+kLAXVBNazgoYHUE+dpbofHO5DQ7lKrY+3L1kSR
 wrNNvq/rJSzvw2IAGgnyEXun8C9d63LFOqPxsBw5qM3nVSLdqdzTzC9mY0hspVLrnLWmHMvfSnA
 CY9GexbKmqKix4FCN+7G3bs/8kX/UjvURsuXt4B0/DYM2G7qWFQPWpMAR7aQyWP1diESCiHl3Jo
 DXGpcaVsk96sJESYdyV2D3PHus99acBx1EzIpQKcyloKAsP50eH9VRE95aLgl+NAmC/6Kh9c/Ue
 vmO6CQt8+1uXY3A==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14018-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,checksyscalls.sh:url]
X-Rspamd-Queue-Id: 517C238DF53
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 02 Apr 2026 16:36:17 +0200, Thomas Weißschuh wrote:
> checksyscalls: only run when necessary
> 
> Currently checksyscalls.sh is unconditionally executed during each build.
> Most of these executions are unnecessary.
> 
> Only run checksyscalls.sh if one of its inputs have changed.
> 
> [...]

Applied to kbuild/linux.git (kbuild-next-unstable), thanks!

[1/3] checksyscalls: move path to reference table to a variable
      https://git.kernel.org/kbuild/c/263246f2
[2/3] checksyscalls: only run when necessary
      https://git.kernel.org/kbuild/c/a414e4ba
[3/3] checksyscalls: move instance functionality into generic code
      https://git.kernel.org/kbuild/c/a46f42c3

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped,
reverted or modified (e.g. trailers). Patches applied to the
kbuild-next-unstable branch are accepted pending wider testing in
linux-next and any post-commit review; they will generally be moved
to the kbuild-next branch in about a week if no issues are found.

Best regards,
-- 
Nicolas



