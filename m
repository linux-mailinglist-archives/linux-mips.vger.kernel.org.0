Return-Path: <linux-mips+bounces-13815-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNSrEriFvWnQ+gIAu9opvQ
	(envelope-from <linux-mips+bounces-13815-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 20 Mar 2026 18:36:56 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CD72DEC04
	for <lists+linux-mips@lfdr.de>; Fri, 20 Mar 2026 18:36:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B39CC31371CD
	for <lists+linux-mips@lfdr.de>; Fri, 20 Mar 2026 17:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABD0E3D410C;
	Fri, 20 Mar 2026 17:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WEZeT8Mq"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5903C13F0;
	Fri, 20 Mar 2026 17:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774027759; cv=none; b=Xpyzbycg5BTInw0BK1cmp0WCW6iJgoLKmBbNqVGeBKeaFGj5DCA8afGRGPb1/rB8meUXQua8G5r2UYesxpk8413Dwp6p+LBA7JYRuZb8LntPKkvdFtpZK8M1VBVwKASK3dn0TOokg2dB9JH3NLhFUoad7EshuVwFhye0XrnoamY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774027759; c=relaxed/simple;
	bh=KL4Jae89rSVWL2OaJl3ccag8DjPv74a4ghmLhVe/bfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WGjU9ceFTRXGKhtpr87zAfW43YyzDZYUmEFluywvsNdtX01jVZYPEGCH4zuqemMAsWu67FnqVPQO0YtIIDLeDVd8/OjYrFXhm9SklSv4NK5CGLL4z43T4l0m+ooiqmaCmHpGazy7O+w9S71owuOo48NVpYzAfSVou0FsMvd/+00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WEZeT8Mq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB805C19425;
	Fri, 20 Mar 2026 17:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774027759;
	bh=KL4Jae89rSVWL2OaJl3ccag8DjPv74a4ghmLhVe/bfM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WEZeT8MqlG7GzmP92SVfj1bXegNdXjW7KC2l2yubQ/cYdoq0NbVZgmeyuvi8Wi/jZ
	 ZfiGcJtww7qlVIe3+/pEpqkd7cgmb3GOX+iePJgEqYPqNIn6RMiqGv0liws7uMjwxI
	 hKqqBy55P5huOnyhCsAgQoRFs9/I4vGqDeVPGdui9wi50yioIxNOsvdjzqtRu5ErZk
	 ikVF1yCqvuYLkanDeyjf6A0swpttVwwatVA86XteWRj5SKYKx1FpOyvJ7TCptBC0bk
	 eEPVn6pay1p7xwT6Ptj/l8dwpd/p5rwUV9wvw9DScPGE8MiVIaxL6Tw7GERtZClZ6p
	 jljQ+fh6ehBUA==
Date: Fri, 20 Mar 2026 17:29:13 +0000
From: Conor Dooley <conor@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-pci@vger.kernel.org, linux-mips@vger.kernel.org,
	naseefkm@gmail.com, ryder.lee@mediatek.com, bhelgaas@google.com,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	ansuelsmth@gmail.com, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: PCI: mediatek: Add support for
 EcoNet EN7528
Message-ID: <20260320-deed-baking-c9a56f5a3396@spud>
References: <20260320094212.696671-1-cjd@cjdns.fr>
 <20260320094212.696671-2-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F1qAZaavm09AyQvY"
Content-Disposition: inline
In-Reply-To: <20260320094212.696671-2-cjd@cjdns.fr>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13815-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,mediatek.com,google.com,kernel.org,collabora.com,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.957];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,microchip.com:email,cjdns.fr:email]
X-Rspamd-Queue-Id: E8CD72DEC04
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--F1qAZaavm09AyQvY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2026 at 09:42:11AM +0000, Caleb James DeLisle wrote:
> Introduce EcoNet EN7528 SoC compatible in MediaTek PCIe controller
> binding.
>=20
> EcoNet PCIe controller has the same configuration model as
> Mediatek v2 but is initiallized more similarly to an MT7621
> PCIe.
>=20
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--F1qAZaavm09AyQvY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCab2D6QAKCRB4tDGHoIJi
0jdwAQCWqo50ANE3wn0rwkGs1a9NHi1dTUKZkUxcs6zAGNOGRAEAxIzz3jmj2GCo
A0OSSo/0h6WBQbAHkWTB+0zxRfxn7QM=
=1CjB
-----END PGP SIGNATURE-----

--F1qAZaavm09AyQvY--

