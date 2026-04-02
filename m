Return-Path: <linux-mips+bounces-14012-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEAhMiF9zmnBnwYAu9opvQ
	(envelope-from <linux-mips+bounces-14012-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 02 Apr 2026 16:28:49 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E22138A83D
	for <lists+linux-mips@lfdr.de>; Thu, 02 Apr 2026 16:28:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E5241312BF0C
	for <lists+linux-mips@lfdr.de>; Thu,  2 Apr 2026 14:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EEBD3E4C67;
	Thu,  2 Apr 2026 14:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mgWYToaR"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3EF3EC2EB;
	Thu,  2 Apr 2026 14:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775139640; cv=none; b=dG94t/Mq3BPavF6fihRyZ4hsOie7hP0OJ1wOYW1SP0Qcyp/Mjp5aFXXP1qrF80Q/RdgC68UXu94aAKY5VteZdpk6k6xSbU00//2EdYZfz0dMDrsRaPNw0XDMMl14aDOIEWFHOFiXXFkiVYQF0YhNGuQRclLhGOBHzpY/YR/vnj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775139640; c=relaxed/simple;
	bh=fIKB1QRkqZSsdTZwKhsMqTz3wrr5j3ZI80ghQxIxP9M=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=iIO8zANlcuicb6KPjEgzoM0nxTtmrhWujTYoJz0NwIafxwsJ35xAs3JPgpq3KtsWdPEykTDpBJzK7YEzeDjqdfsPweQ0lw0DZ+6YB+YGpld205apxngnMv6f1AMybYE4M0mcvO23Nxo1YLyiEceE/P86UV7nSDfHkVKOd8whxuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mgWYToaR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2AFBC116C6;
	Thu,  2 Apr 2026 14:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775139640;
	bh=fIKB1QRkqZSsdTZwKhsMqTz3wrr5j3ZI80ghQxIxP9M=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=mgWYToaRIXZPHE68buDhp6ekPuK14DjS2qds0OnwqFJ7tUDexdkzZLoJ/Tf/7FJTO
	 5J1x7Z9L1392EstZ0C+wkiivRNh2EzMYcSEWbyaVFkn9OUw6Ag5Or/ELTjAhk0PMKS
	 dRdq0l5oPQTmW6ckgWOULfqMDmlr9uYzyar1E1E3Xw8y3IvlA0wZwf0xQurhnvE+HS
	 6RxxFW/nqPgH7jZEtzB3AYe+VZ++Kqz6ujdsl3vfQ9XtaK8DM1n51bE/Q9FcFjKtcy
	 ffyFPkT1v0eCwISSj2E96RZe0qsIlPEThA0TTiSilrGhHgBicqjaetXGMowHvGtVLy
	 2GEdxYHYO9/SQ==
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 3/3] checksyscalls: move instance functionality into
 generic code
From: Nicolas Schier <nsc@kernel.org>
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-kbuild@vger.kernel.org
In-Reply-To: <20260324-kbuild-missing-syscalls-v2-3-651b8beb0bfd@weissschuh.net>
References: <20260324-kbuild-missing-syscalls-v2-0-651b8beb0bfd@weissschuh.net>
 <20260324-kbuild-missing-syscalls-v2-3-651b8beb0bfd@weissschuh.net>
Date: Thu, 02 Apr 2026 16:18:50 +0200
Message-Id: <177513953036.3276215.12313311452820248264.b4-review@b4>
X-Mailer: b4 0.16-dev-ad80c
X-Developer-Signature: v=1; a=openpgp-sha256; l=787; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=fIKB1QRkqZSsdTZwKhsMqTz3wrr5j3ZI80ghQxIxP9M=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBpznrQe2mhCvx+rDKNS2SZqcbcGJBtSSTrDkCbZ
 6J8zyRZiUWJAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCac560AAKCRAHUgpwFiYS
 aeAjD/wJ77/PPJDanQS9VI4sNPjFKtkK8hYNaOotTObJGZaFo6LGv4EMIfyi5M6B/ue12RpiINc
 F6xcaz7wowWqeDCCXJz5qiXoh1m00TyG2ArlqgoZlKdVNyBT+IJIw9hlRMggvjKZhYsh0PMvaPa
 vUpjJCHiQ6HshmUpQ7UXiLYCTPebViNLRH/41nrEBsI1OzmImP96iKtgQ34wFijoJhwhu0voil5
 mwZlx+WoH4GlN9Ttpy1f0cqf6cF5NNGTTIdumSa9nDn3yplND6aV4EYlW1cPyH7B8QbC0864J7I
 6anrVaRcWvXRcTqa9tmqGHfilfz35zJ4Qy4WoiCO+TB8iaFSHQ3XHUa0ZxKNzmQFPQgNo9mA9/y
 m9EEYH8wpHULe4XiX7cWmnKOVVktB0eU8ayW+ka65ji73yvS0XiRSFajfLhawT0Vvd9kXChw0Ez
 Z82bvjkpAKw2o2F4sZyDNK758eBCxr7KHZNyXqyXx6a6+i58Kuf1EtXjZwyDbfJltfEIa/KSaHh
 TOA9NlPKNA8bFN3R+TYL0a/Ox599muBL4xS/NBDzx1/h/vP8alqJxTl21hF7rE1aiVXDnLynxe2
 qtbdCAQjhBVYo1C27wjCZuOxMIFFxckUQYNKX5/arOYC+YJXHWIcpZyCO6TxRCQ1QENODYMEGRo
 lJyIxi1s5sy1ftg==
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
	TAGGED_FROM(0.00)[bounces-14012-lists,linux-mips=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3E22138A83D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 24 Mar 2026 18:16:47 +0100, Thomas Weißschuh <linux@weissschuh.net> wrote:
> diff --git a/Kbuild b/Kbuild
> index 515cc6a27477..fb547bc5ff41 100644
> --- a/Kbuild
> +++ b/Kbuild
> @@ -47,11 +47,11 @@ $(rq-offsets-file): kernel/sched/rq-offsets.s FORCE
>  
>  # Check for missing system calls
>  
> -missing-syscalls-file := .tmp_missing-syscalls
> +missing-syscalls-file := .tmp_missing-syscalls$(missing_syscalls_instance)
>  
>  targets += $(missing-syscalls-file)
>  
> -quiet_cmd_syscalls = CALL    $<
> +quiet_cmd_syscalls = CALL    $< $(if $(missing_syscalls_instance),for $(missing_syscalls_instance))

Nice solution!

$(addprefix) shortens a bit here:

quiet_cmd_syscalls = CALL    $< $(addprefix for ,$(missing_syscalls_instance))

-- 
Nicolas


