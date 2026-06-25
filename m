Return-Path: <linux-mips+bounces-15200-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bmC5LtXKPGrGsAgAu9opvQ
	(envelope-from <linux-mips+bounces-15200-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 25 Jun 2026 08:29:41 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C495E6C3086
	for <lists+linux-mips@lfdr.de>; Thu, 25 Jun 2026 08:29:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=goldelico.com header.s=strato-dkim-0002 header.b="KZxdri/Z";
	dkim=pass header.d=goldelico.com header.s=strato-dkim-0003 header.b=J3a7Yqk4;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15200-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15200-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=goldelico.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EA3FC300BEAB
	for <lists+linux-mips@lfdr.de>; Thu, 25 Jun 2026 06:29:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 321B43C09FB;
	Thu, 25 Jun 2026 06:29:34 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C361D47AC;
	Thu, 25 Jun 2026 06:29:29 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782368973; cv=pass; b=Njbl6vTLZgkbO6m2VITVCtFaiaALcL4yC0dYDfjEiMm3jGLUC0k2nQjjFGtWLxJJJu38RHjbs7QR51LQW5VBhDltzxJ6MouTKJiKavRBq6SH9BecytNi3mhL6QrAy7chFbKHc1XoOxftLif9X/ers1L4sL0+zwlxY4Y50Aog0XM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782368973; c=relaxed/simple;
	bh=/XDAhT/gahcsgyGYK+KIom9cb93lEXn3KvPR/sYEQfk=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=hU0Pqq6ML5eNcLted1YAwASaKyj+PcM3YdmGHUWW8jymSLsntMg8D86P4qXRzZTFuzGDC0M6yEuhNnJ4Hv6CE2tyRSQa14HeBARXhzCCC+EF8k/tbgWFzg61r9pr05MSkjER2tDEcuurqRZlD4/MYTGfTrk19sRDMiyb2UlbDps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com; spf=pass smtp.mailfrom=goldelico.com; dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=KZxdri/Z; dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=J3a7Yqk4; arc=pass smtp.client-ip=81.169.146.221
ARC-Seal: i=1; a=rsa-sha256; t=1782368948; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Xf6OALEkhFnG/cjpmgrAAiPi/iyswDeFmzoSXmUODWiT/Kwgyhm9I3WlzehYqV38Lw
    JdEIUuuA8aMtpc99Qm8BTvk7B/Il49n4hKcXmRFIEt41abzzFsXUsCvgFUs6yj1y/D88
    6L/bh2Cv64CgDFLtMqTSKhip/afD7z7wKymvtqIKx00Ls5fOjSqxA9VwW6plySfaaggO
    y0MtR4djs+bdIzrfi6n+BtQNsPwbsslzkZZHNs4YoKVaEnadVv3GYwBRUfMEZ+t68WZB
    IvCSJPSmDE+32f0IqDlI50ZHLqz4WcwU0PntgkRkvnk8ljXrcbZnuW0SXM9widVTyMdy
    fh4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1782368948;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=pLkiWYJBXI+Ax9lK/VMWNvpSnRJFMN12OEU0EcCGTFg=;
    b=d3n7rdEy2uk/MHhask6I63GRoWhUtU7PrkD75+srjej38g65YrFaYvUWaNLgMA4zyn
    SfA2ROjNtEnmjnfpKuOLJUSd3gIn4FCef6FemwIgs8YSCnvBqZWIcQWeICmJQtdOIZZK
    KZB5Sng2Gm+Haq02RWjDKJuce2WSbZWfZ9sWFmh4OCJuTK8y2dWa65FPN2aN8t5G6mlZ
    vHsCp7aKZAk8AbxqkY/RSAJb4dY4fxZeaaJalPIH/29neyQR0Cm9G+CJw8D3ClMph5R5
    zaUx6hLftDeMiiHwba/7vPDeGas6jeRYMMo9FnnsCP1eWUb1AMipTdMkqDPo/J7kVkCw
    xNcw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1782368948;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=pLkiWYJBXI+Ax9lK/VMWNvpSnRJFMN12OEU0EcCGTFg=;
    b=KZxdri/ZvMwVU6hHNqzdods9JDsE67TpcOI2fw514ELPFN1jN2476gifQgPgPpAs8V
    OJeMKyp8s2QggPncu52gpoVcoejayUhS6aMIybozIepZ11uQmTsRNMq5m7Wd0pT1XUtY
    VX1n5ti2OKKTSmL6+h+fCg7HPeGe4HFcYsogiZXcsE7u8JfEZa9T5HDpl8jdXKBVnVkg
    mV9qFHnYUn4KykMFxmrsKcTSejaag59yLlAv6IOlw1hIkn5mA9K2eNdnsPhE4zyNep11
    nMv5bbGoPGlOnqgwYVTa5gZUogouMi31ECGiLHExAa8M7xcf55e3O2zLKAvBBfPCU/K4
    NXRA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1782368948;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=pLkiWYJBXI+Ax9lK/VMWNvpSnRJFMN12OEU0EcCGTFg=;
    b=J3a7Yqk4zy3v3l4WWYg+Zbk0SdX+48nyK4J4mGira9QrCc/ueV2Yu2LNf4+S8uPDgH
    gwoum/Foj9s72xWWlqDw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrQjZoMyciNdhuVwbfw/uRWQZfrUXlac42eV/fu"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.0.1 AUTH)
    with ESMTPSA id Qcf97c25P6T84Tp
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Thu, 25 Jun 2026 08:29:08 +0200 (CEST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.8\))
Subject: Re: [RFC] pinctrl: ingenic: impossible MACH_* guards can drop OF
 match data
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20260625060959.17290-1-pengpeng@iscas.ac.cn>
Date: Thu, 25 Jun 2026 08:28:57 +0200
Cc: Paul Cercueil <paul@crapouillou.net>,
 Linus Walleij <linusw@kernel.org>,
 linux-mips@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <DFFC2DF8-358D-4FA4-BCF1-9AF608940090@goldelico.com>
References: <20260625060959.17290-1-pengpeng@iscas.ac.cn>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
X-Mailer: Apple Mail (2.3826.700.81.1.8)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[goldelico.com,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[goldelico.com:s=strato-dkim-0002,goldelico.com:s=strato-dkim-0003];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15200-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:paul@crapouillou.net,m:linusw@kernel.org,m:linux-mips@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:letux-kernel@openphoenux.org,m:pengpeng@iscas.ac.cn,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[hns@goldelico.com,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[goldelico.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hns@goldelico.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,iscas.ac.cn:email,goldelico.com:dkim,goldelico.com:mid,goldelico.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C495E6C3086

Hi,

Since I am just these days working to extend the ingenic-pinctrl driver =
for x2600
support, I can comment from a distribution kernel perspective.

> Am 25.06.2026 um 08:09 schrieb Pengpeng Hou <pengpeng@iscas.ac.cn>:
>=20
> Hi,
>=20
> while auditing conditional data-provider paths, I noticed that
> drivers/pinctrl/pinctrl-ingenic.c still derives some SoC descriptor =
exposure
> from IS_ENABLED(CONFIG_MACH_*) style conditions whose corresponding =
Kconfig
> symbols do not appear to exist in the current Ingenic Kconfig =
universe.
>=20
> This looks like a data-symbol legality issue rather than a simple =
cleanup:
> the OF match table .data entries carry SoC-specific pinctrl =
descriptors.  If

The idea is that you can choose through CONFIG_MACH_* which records are
included in the match table at all to be able to shrink the driver to a =
bare
minimum for embedded use (e.g. X1600 with just 32 MB RAM).

Or have a full driver for a distribution kernel which supports all =
options by a
full driver (module).

Currently we have in the LetuxOS kernel:

grep -e "CONFIG_MACH_JZ" -e "CONFIG_MACH_X" .config
CONFIG_MACH_JZ4725B=3Dy
CONFIG_MACH_JZ4730=3Dy
CONFIG_MACH_JZ4740=3Dy
CONFIG_MACH_JZ4770=3Dy
CONFIG_MACH_JZ4780=3Dy
CONFIG_MACH_X1000=3Dy
CONFIG_MACH_X1600=3Dy
CONFIG_MACH_X1830=3Dy
CONFIG_MACH_X2000=3Dy
CONFIG_MACH_X2600=3Dy

> the guard can never be true, a compatible string can lose the intended
> descriptor provider even though the descriptor is still present in =
source.
>=20
> I am not sending a patch yet because the correct policy is not =
obvious.  The
> possible directions include:
>=20
> 1. remove impossible MACH_* gates from the OF match data;
> 2. restore current Kconfig symbols for the intended SoC families;
> 3. split unsupported legacy SoCs from supported descriptor exposure; =
or
> 4. keep the gates and document that these descriptors are =
intentionally not
>   exposed.

5. keep it as is and wait until we can upstream some missing SoC =
families.

(BTW: can you list what you think is unsupported legacy or impossible =
please?)

>=20
> Could you confirm which direction matches the current Ingenic pinctrl =
support
> policy?
>=20
> This is static source/Kconfig analysis only.  I have not tested the =
affected
> hardware.
>=20
> Thanks,
> Pengpeng

Hope this helps the maintainers to decide.

BR,
Nikolaus


