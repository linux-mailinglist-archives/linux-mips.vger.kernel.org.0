Return-Path: <linux-mips+bounces-13901-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BnwLaTcwWmJXQQAu9opvQ
	(envelope-from <linux-mips+bounces-13901-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 01:36:52 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 365392FFBFE
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 01:36:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 49CB430DF958
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 00:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E87EA2F3C3D;
	Tue, 24 Mar 2026 00:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LsEKtsmj"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B551531C8;
	Tue, 24 Mar 2026 00:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774312238; cv=none; b=S2fX3N72ooAYxfrI6bpfwO0jc6Ii4gnpX1Fng5qO3Viw+3gA01QKA08aHKCh186zkflqVWwfpYFWeW9xpl+U2WoTCwvG7neEZ0Kpnz4WNBoMcvZ1i/nLtiGjSXzHvOH0cMNmv7st2IiJk8haoKLI6jCPJcPyt7VG4cIxvVqYPI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774312238; c=relaxed/simple;
	bh=X1i/VZEKkmSxaUnc9VvTEnbQWg76BcLl9EkryKFkjIY=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Vo1LTMbGuD90J7GsgsIJ5nixGKTPvLpv7iP8zHSDi+xvtWIo5JJl+43WB1tS0zl03a4wTdrsVuHQQSywBNmniufLZbHAgFGQwxkRxIZsSqBCzfPwoRGoiORwXgOsRObA5KHEZ/ic29w/a7qLXjKlxDVCYaThZA22MD3LT3CvQ9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LsEKtsmj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 619F0C4CEF7;
	Tue, 24 Mar 2026 00:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774312238;
	bh=X1i/VZEKkmSxaUnc9VvTEnbQWg76BcLl9EkryKFkjIY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=LsEKtsmjUk0DQM1PejAQBVeWwXavbHWrGBewfAbu+OfjWVDphOek7R9oI332iHpJM
	 PQmyNSIN5/tAxnb0oW/weQpvYmpZxCstf/dkS1b0bisEIUqOn5CJ1GvpDNmRe7bzDn
	 X8HjpJ0d0kFqE/VGZuUDbqJ/XTYgFp4f8opCSE+TEFoJAVq74LZTm/cZbIO+i6mvv/
	 xnelwWMngd6cMIyXoFLpckAvcb/O0oZZWYuis6bbLq5FmYUYYX8q03GO+ihOeOu+JA
	 1c/WYPEGLiTY+MvHxsP8+PN+zCe2DieSbl4hKnzSTM7AEATTeeBIsP9NiR0gfEwT5I
	 S7CNa+tJdVqLQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260316-eyeq6lplus-v4-9-bf44dfc7a261@bootlin.com>
References: <20260316-eyeq6lplus-v4-0-bf44dfc7a261@bootlin.com> <20260316-eyeq6lplus-v4-9-bf44dfc7a261@bootlin.com>
Subject: Re: [PATCH v4 09/13] clk: eyeq: Add Mobileye EyeQ6Lplus OLB
From: Stephen Boyd <sboyd@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, =?utf-8?q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>
To: =?utf-8?q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>, Conor Dooley <conor+dt@kernel.org>, Gregory CLEMENT <gregory.clement@bootlin.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, =?utf-8?q?Th=C3=A9o?= Lebrun <theo.lebrun@bootlin.com>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Date: Mon, 23 Mar 2026 17:30:36 -0700
Message-ID: <177431223645.5403.16653850109546680332@lazor>
User-Agent: alot/0.12
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13901-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sboyd@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:email]
X-Rspamd-Queue-Id: 365392FFBFE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Quoting Beno=C3=AEt Monin (2026-03-16 08:25:46)
> Declare the PLLs and fixed factors found in the EyeQ6Lplus OLB as part
> of the match data for the "mobileye,eyeq6lplus-olb" compatible.
>=20
> The PLL and fixed factor of the CPU are registered in early init as they
> are required during the boot by the GIC timer.
>=20
> Also select clk-eyeq for all EYEQ SoCs instead of listing each one
> individually, as it is needed by all Mobileye EyeQ SoC.
>=20
> Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

