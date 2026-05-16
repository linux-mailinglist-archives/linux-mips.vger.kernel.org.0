Return-Path: <linux-mips+bounces-14615-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGp9JNf+CGoqEQQAu9opvQ
	(envelope-from <linux-mips+bounces-14615-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 17 May 2026 01:33:43 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 980BC55E497
	for <lists+linux-mips@lfdr.de>; Sun, 17 May 2026 01:33:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 743873004D33
	for <lists+linux-mips@lfdr.de>; Sat, 16 May 2026 23:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C12B37DAB7;
	Sat, 16 May 2026 23:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QfNV8GmZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131B24F5E0;
	Sat, 16 May 2026 23:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778974416; cv=none; b=h+bKhe98KdJBNB5hQ83FswQ87zdo0uoB2bK9DqTnzLRffd2G+QvWyMkyjWUQkmtpttdV1VsV/MW7NiT4+3+Ea+yEU32LVy9YeZLik1m4gx2kocVp3EeFIS9uuNWv8Y9A56rL+Q6PgXJ+ppitZaS8TYbRLOyL2UiyVhnuNuR3GGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778974416; c=relaxed/simple;
	bh=mqNpFSASpXFXAF5qJfYTPJv1dlhDZQbead2xI1Jt75s=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=jjxJzrXiRmKbdU2KeVmKBam/s9DeHG2UF4rszDrrVe9ssysHmjEVE3q7pmQF+r5hWXxiT0JXswN2YPJxLgiG9TKCXs8gIDtBIEoWxjOTxWPA3uaLXgtHq16RPv7eM/1U+9ZboZ+pvgc0Q0Q7kCSd6i32iAFgFvRfl1ldPewMg8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QfNV8GmZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71CCAC19425;
	Sat, 16 May 2026 23:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778974415;
	bh=mqNpFSASpXFXAF5qJfYTPJv1dlhDZQbead2xI1Jt75s=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=QfNV8GmZcu3Govd5WyUv1nFE7PdXhmWK+K4Pw6Bzg0VnTLGrjkjEZm+RaNbwFAvCJ
	 qNpLgQie+o7znMDxPCg1BjLe8dMUNbneuW6ZaFypH12s/sBwseOLv7n1EEETe/YiAF
	 XZnSRCi9suIFJIoxiFyvK7JG2c4DrYNT1l9s2rg4UE6AL9Q8SBwWnhG84NRci9GrXE
	 IIX74OzkCvDfBDvztb2Z69VvhGDe2FtGXOS9tQqiBCydpAb80cwqCd1O30TVD0rDWj
	 x/OP6sUH5eULODB+MtCdd9ik052QFLiy98uEcvtgCbCSwSw0vyQhgHBSohkOQ5v4Re
	 McxPUaccf2P2A==
Date: Sat, 16 May 2026 18:33:34 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 naseefkm@gmail.com, daniel.lezcano@kernel.org, tglx@kernel.org, 
 linux-mips@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
To: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <20260516215720.4160831-2-cjd@cjdns.fr>
References: <20260516215720.4160831-1-cjd@cjdns.fr>
 <20260516215720.4160831-2-cjd@cjdns.fr>
Message-Id: <177897441456.3240313.1175010448862132578.robh@kernel.org>
Subject: Re: [PATCH v4 1/4] dt-bindings: timer: econet: Update EN751627 for
 multi-IRQ
X-Rspamd-Queue-Id: 980BC55E497
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,kernel.org,microchip.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-14615-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,cjdns.fr:email,1fbf0400:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Sat, 16 May 2026 21:57:17 +0000, Caleb James DeLisle wrote:
> This hardware is found in the EN751221 SoC family as well as the
> EN751627. The former uses a percpu IRQ for all timers while the
> latter uses an individual IRQ number per timer.
> 
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/timer/econet,en751221-timer.yaml | 23 ++++++++++++++-----
>  1 file changed, 17 insertions(+), 6 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/timer/econet,en751221-timer.example.dtb: timer@1fbf0400 (econet,en751627-timer): compatible: 'oneOf' conditional failed, one must be fixed:
	['econet,en751627-timer'] is too short
	'econet,en751221-timer' was expected
	from schema $id: http://devicetree.org/schemas/timer/econet,en751221-timer.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260516215720.4160831-2-cjd@cjdns.fr

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


