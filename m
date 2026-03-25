Return-Path: <linux-mips+bounces-13939-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPCpEjbzw2lZvAQAu9opvQ
	(envelope-from <linux-mips+bounces-13939-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2026 15:37:42 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB6C326DD8
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2026 15:37:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9B9B4300C35B
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2026 14:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29F2D3C5550;
	Wed, 25 Mar 2026 14:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q+qmW1/2"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050332459C9;
	Wed, 25 Mar 2026 14:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774448526; cv=none; b=C2I6OFMizDCdri2R9bsXAaYBecrwOp7pq8BulhN4YQ8B0ziYeqUH5Nhm7CkPY3rf/mJ107QKZ+Ml1ljnVRAye5Bb2GYJheKT2Vm0fl6ovSxLeXz+r9pcyLDbSuAftDSjBCGNnOqpapVdfDEi/DpnZuyqsXgxeABlXxdhc822kVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774448526; c=relaxed/simple;
	bh=D8plBvkxo4lFOs0Y+oJaSKr/RKE855ApyeyhXvod+fA=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=aR/V1dsrGSnk0w0KYk8tEcVkcY6rGPiy8ixRB8TcZ1LhrI2CatdYw7f5GRp2oPOXke3BY1DhUe2ygWrXlYbck9Gn5VDvkuHAoN/45YaitwlnDb2ohjdiYN7Ar2XeVN5o8A5xisjoRCoBRMuiN0/JvMMpsBm577yjEkAoxEj9feM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q+qmW1/2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73195C4CEF7;
	Wed, 25 Mar 2026 14:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774448525;
	bh=D8plBvkxo4lFOs0Y+oJaSKr/RKE855ApyeyhXvod+fA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Q+qmW1/21X4QW/08xsUd2EPczPV3dTj18p+zRVzh4A6EfSXHv+LpwoN4r7UvDnNjU
	 YOYmcftw/1XtTkGSEUNHzlNSzYbRwpdDxiTEE/MjKutjGfxKEz/jVoG/xH+AfWty1L
	 ZhITu4QVPEtFmo+JT2YA/PaYKY9ciOjtiqYRI1QdSPaSnQVfhXYG547eZgRu/qjdO0
	 HGapF7WtaIkY2wIFyydbGGsbHdhC3/iP/OP2Tw4PGPVDlkZl8sEmIZ9QEke0GVus+n
	 XoDMk9P+qYk2L11/oFWJQrtfSUrRKTbp9mrJdsAA/qTgrJBoiWgQ0Ifwbom939nV1u
	 6WFQAMoVbTOog==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260312162449.569359-3-cjd@cjdns.fr>
References: <20260312162449.569359-1-cjd@cjdns.fr> <20260312162449.569359-3-cjd@cjdns.fr>
Subject: Re: [PATCH 2/2] clk: airoha: Add econet EN751221 clock/reset support to en7523-scu
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-mips@vger.kernel.org, naseefkm@gmail.com, bmasney@redhat.com, mturquette@baylibre.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org, p.zabel@pengutronix.de, nbd@nbd.name, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Caleb James DeLisle <cjd@cjdns.fr>
To: Caleb James DeLisle <cjd@cjdns.fr>, linux-clk@vger.kernel.org
Date: Wed, 25 Mar 2026 07:22:03 -0700
Message-ID: <177444852331.5403.14382259400187114857@lazor>
User-Agent: alot/0.12
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13939-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sboyd@kernel.org,linux-mips@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,redhat.com,baylibre.com,kernel.org,pengutronix.de,nbd.name,cjdns.fr];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cjdns.fr:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5AB6C326DD8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Quoting Caleb James DeLisle (2026-03-12 09:24:49)
> EcoNet EN751221 clock/reset driver is significantly similar to the
> EN7523 / EN7581, however the EN751221 does not have a neat batch of clock
> divider registers so there are fewer known clocks, and the frequency of
> each clock is derived differently. This clock driver will probably work
> correctly on EN751627, EN7528, and EN7580.
>=20
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> ---

Applied to clk-next

