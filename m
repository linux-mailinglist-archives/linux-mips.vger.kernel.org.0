Return-Path: <linux-mips+bounces-13447-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPrOB/Dlr2nkdAIAu9opvQ
	(envelope-from <linux-mips+bounces-13447-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 10 Mar 2026 10:35:44 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7512488C0
	for <lists+linux-mips@lfdr.de>; Tue, 10 Mar 2026 10:35:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D27E3034DD3
	for <lists+linux-mips@lfdr.de>; Tue, 10 Mar 2026 09:24:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 905BC2F84F;
	Tue, 10 Mar 2026 09:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k4Lfwmg0"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB27E363C56
	for <linux-mips@vger.kernel.org>; Tue, 10 Mar 2026 09:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773134654; cv=none; b=HPQqjDhlOB7Hih7DVJiE+SIEHpLmDe5t+793AMtGx46cQGjvN7h+BJlFNH/nSMLI6J1WnHHJHmvEmQ1cjFWZ4RyD3YDwAETA0yrOxlv1pgynsVHayV+jta311cJgiA5uzWmJGK3LfwnNClKWoq1Tb/1RB5ZYFTAucH1qeYSE9GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773134654; c=relaxed/simple;
	bh=Z7TSZ0+4Pm7XcmwTDND+czsoVKkgozXRLpMxa9yqOrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AaW3lw7OEmhk1b2TbidDUJcqLMjTJxvPAqj4hcDtgVzSjdvYwSCypAq96QgBRZbXmoS5u5kgKhaR9LzzGevZC5b37KbFlg5U5wXO33wR1H6mWicq0XoOhz6R/QRvwi1piNNY1+g3yMKXk3xiLl5mAuCXe8LmzFAZidj8gA+tzvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k4Lfwmg0; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48533a598fcso891005e9.0
        for <linux-mips@vger.kernel.org>; Tue, 10 Mar 2026 02:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773134651; x=1773739451; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WZCj/TjHIXVRoVKGE6NQ7feI9pXMgzpRbm+P3PxeGt4=;
        b=k4Lfwmg0hdnQATKaQViH/3mumpeU670p/b/yAVc9Cg63Dtnt3jn8aZO8VKp2IPuBTf
         47lT3tfOskUW0krlDttttKbTQk4Oj0XcH+Z4GQMmeg/edrNEWWhaKSXRxEW6S9ba1KgB
         VmtlM5AuuRc0ZfIjSay9eva4hRoIsMmIMp+AkpIqHbJxP77oNfft/od7NLPPxsQD3nTd
         hyRzVy4L/9xuhXeLvSN6Cl+RR/yhSOmde1rLioutY3SalH28YSACupqOiAzfp9bjH/LH
         +tfpVgZ8bLfbD9rHuRa+dg1Ypk4rzoK6jxFpPEjJKZKzHq1Phv9U0+vsblpzoS3D00S6
         x3mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773134651; x=1773739451;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WZCj/TjHIXVRoVKGE6NQ7feI9pXMgzpRbm+P3PxeGt4=;
        b=i9UaFJTZOzt4SVY8nyNH5boQ8GSt85TIiqQERN8OHgtPgtdalLiyqGH88F/Y/RzRPe
         JenNmFDUQeuyUS7JtxSz29EB4Okv9ewjzRyllLtJqIMpdb0a9E7Gq+DRIuG7HnsmJ8OA
         MF5pfQ3vun7Q0BVEXOLvbBgKzcjVU9RSYNBIY2TZMC1N3M3QBwwKty9jxybobzihzwSI
         EcZMY4fLu13TZXd9z60krBObgUXrWlAzCNrUsYDvToel/t8Au+66rB5u5pKiDxkmhjYt
         upyjqvUY0x3ioxjMbOwP/0LOgviNAlTJ0xLw67dF5nSzkCm1bfqz6UJGG2/OVcHJREjV
         44Ew==
X-Forwarded-Encrypted: i=1; AJvYcCVqDzIw1QcSi/oF1NnRuBkoXpiZz0VVnBW1Zsf4sZ/rfy2pj4nsUkdfP1uTQIglymRor+a+t4zCZ2JH@vger.kernel.org
X-Gm-Message-State: AOJu0Yya6GbwhAcyfSlpMeZ2Ov5qUpaFQ4ArobUIQMxHC4x7yVy0JkgO
	knl2qgZcThEnn/i72dGf2EktDXPw882hvt89I/UvLIiQEtmIJipIxD4r
X-Gm-Gg: ATEYQzyZFpnnuwQ68YwN992/U+h9j3fBEAbCBkwa8lynkBeevL4y3Hp+LZdPDWLyULu
	x/5MSmSBdEiGFxcRpPfKPCP5mGs9YfXBsjlmNbEMN9hlvWEtubnOEgAnBQm80mplYxoRB5sXsdQ
	WS++wSkBVSE3sFJwv0UKA2LbEtA2WOliGBDvoBiU1R1mF9tyiy2vyH2rXqyXH5BG+mbTrdNlmXz
	QpT5MuBOgzu0pTblovJo5rkyay5glWf0cywy5Ko25TUqqRLJFa6LyUUQmSUMWUzqrDJPO8OPGcY
	c/nwLjjtYw60Ql47qMUC05znDd3AZ3+MICskQ0wF6y96gf25KEovE7r4H3o+Fw9hQUpcUe1oTHg
	4RjjaAKfji/5cIVU653AEmk4eIL8upm2xmoxPXKEKuS/nPh/yHMC96SsCMS2vrXopKYbs/NmkyS
	nPfCLR5A3NTXiTenxvYxc/YDZT
X-Received: by 2002:a05:600c:198f:b0:485:3b3c:1c18 with SMTP id 5b1f17b1804b1-4853b3c1d8emr61523235e9.2.1773134650905;
        Tue, 10 Mar 2026 02:24:10 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d00a:e00:8799:3a7d:3c86:3200])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485246fd127sm169882015e9.6.2026.03.10.02.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 02:24:10 -0700 (PDT)
Date: Tue, 10 Mar 2026 11:24:07 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?utf-8?Q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v9] phy: Add driver for EyeQ5 Ethernet PHY wrapper
Message-ID: <20260310092407.uk5dsn73ccelflgd@skbuf>
References: <20260309-macb-phy-v9-0-5afd87d9db43@bootlin.com>
 <20260309-macb-phy-v9-0-5afd87d9db43@bootlin.com>
 <20260309-macb-phy-v9-1-5afd87d9db43@bootlin.com>
 <20260309-macb-phy-v9-1-5afd87d9db43@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260309-macb-phy-v9-1-5afd87d9db43@bootlin.com>
 <20260309-macb-phy-v9-1-5afd87d9db43@bootlin.com>
X-Rspamd-Queue-Id: 6E7512488C0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13447-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[olteanv@gmail.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 03:37:34PM +0100, Théo Lebrun wrote:
> EyeQ5 embeds a system-controller called OLB. It features many unrelated
> registers, and some of those are registers used to configure the
> integration of the RGMII/SGMII Cadence PHY used by MACB/GEM instances.
> 
> Wrap in a neat generic PHY provider, exposing two PHYs with standard
> phy_init() / phy_set_mode() / phy_power_on() operations.
> 
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

