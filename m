Return-Path: <linux-mips+bounces-14535-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFcrA1N7AGqaJQEAu9opvQ
	(envelope-from <linux-mips+bounces-14535-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 10 May 2026 14:34:27 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C4F503F29
	for <lists+linux-mips@lfdr.de>; Sun, 10 May 2026 14:34:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DC33B301F351
	for <lists+linux-mips@lfdr.de>; Sun, 10 May 2026 12:32:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 442FB3822B2;
	Sun, 10 May 2026 12:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tdp3Vr9q"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B12382367;
	Sun, 10 May 2026 12:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778416340; cv=none; b=smQhSX5zq31x6nIPMgfn7c4s91kSrO6Cn0aBtU6j0E2CsZsENSoGjZiAjXpJ91KbuL8fgFTnq4YrglLnFOV65BDy6paGSfpk61DugP7K73yOreP/ZlmYQulxne+ELIrt1PQqAu/rI/BfaM7FK3liEHSVx6s7m3eJ+V4vr3wZqDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778416340; c=relaxed/simple;
	bh=SDOEyFstRhWIMkhPcOaluZFaKKmrzRYi3jr799ZJPh0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qnrpKNF5pDme0eZu93oK3Sj+xYe6HGfeOIbbXe81nMj+WtnceQXnAtcJ8k9pSZGE7x3524wDRAfZWsQ+22wUKk1zM4vx41h9P7oexbYc3n/+MOp8OA6Hyxm+CuDkhn0IgHLS/nqUmH4af/2kj9V9oGZjO5NSeIUKZuAGkQS004Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tdp3Vr9q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27DB5C2BCB8;
	Sun, 10 May 2026 12:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778416339;
	bh=SDOEyFstRhWIMkhPcOaluZFaKKmrzRYi3jr799ZJPh0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tdp3Vr9q+OVvwpFFWJqQriDFLOKGu+QmfmIBFNtDn26XkwAaK7xxm7avYWX+6q5tB
	 peag60VoWYpfzsNQQCjCMlq7YNzjbVzb0mXTmZbOUVYXnrKNqkyKR+B0No7F/EhXEA
	 D3PbhW837u9DGMV9ZS1t9fQqkXbkndnJhLUz/pSr9K7kS0X8nK/yFGOr6f2b6hJwWC
	 cfzPZF9zdDJuT17QMbK4fefPAYZOoP3Xr6xDbqRYde2ZC1U9pIKskxwi16LFRMSgsd
	 b1knbnJh18qx0miIlJtnOXPhsGRMBCZQDfbt1dGk4/auvbPglMZ9FFdFlCgIiYOYiH
	 S9oRVa0hMmuKQ==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
In-Reply-To: <20260309-macb-phy-v9-0-5afd87d9db43@bootlin.com>
References: <20260309-macb-phy-v9-0-5afd87d9db43@bootlin.com>
Subject: Re: [PATCH v9] phy: Add generic PHY driver used by MACB/GEM on
 EyeQ5
Message-Id: <177841633575.434434.2649556490244169751.b4-ty@kernel.org>
Date: Sun, 10 May 2026 18:02:15 +0530
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0
X-Rspamd-Queue-Id: C4C4F503F29
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14535-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vkoul@kernel.org,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Mon, 09 Mar 2026 15:37:33 +0100, Théo Lebrun wrote:
> EyeQ5 SoCs integrate two GEM instances. A system-controller register
> region named "OLB" has some control over the Ethernet PHY integration.
> 
> Extend the current OLB ecosystem with a new generic PHY driver.
>  - OLB is carried by one main platform driver: clk-eyeq.
>  - It instantiates auxiliary devices: reset-eyeq & pinctrl-eyeq5.
>  - We add a new one: phy-eyeq5-eth.
> 
> [...]

Applied, thanks!

[1/1] phy: Add driver for EyeQ5 Ethernet PHY wrapper
      commit: b6e33443876d0ca7e93cf949455e3c1a1a0aae24

Best regards,
-- 
~Vinod



