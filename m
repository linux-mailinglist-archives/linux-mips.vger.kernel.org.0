Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55D4351DEB
	for <lists+linux-mips@lfdr.de>; Tue, 25 Jun 2019 00:07:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726331AbfFXWHc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Jun 2019 18:07:32 -0400
Received: from sauhun.de ([88.99.104.3]:38274 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725268AbfFXWHb (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 24 Jun 2019 18:07:31 -0400
Received: from localhost (p54B33083.dip0.t-ipconnect.de [84.179.48.131])
        by pokefinder.org (Postfix) with ESMTPSA id 4296E2C0398;
        Tue, 25 Jun 2019 00:07:30 +0200 (CEST)
Date:   Tue, 25 Jun 2019 00:07:29 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Paul Burton <paul.burton@mips.com>
Cc:     Stefan Roese <sr@denx.de>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Harvey Hunt <harveyhuntnexus@gmail.com>,
        John Crispin <john@phrozen.org>
Subject: Re: [PATCH 5/8 v2] MIPS: ralink: mt7628a.dtsi: Add I2C controller DT
 node
Message-ID: <20190624220729.GA8885@kunai>
References: <20190527091323.4582-1-sr@denx.de>
 <20190527091323.4582-5-sr@denx.de>
 <20190528204119.g7kvutxcprhwo56d@pburton-laptop>
 <96f6564a-e45b-a082-4682-c81dde8d22d5@denx.de>
 <20190624212431.lopvs57iondijlyh@pburton-laptop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gBBFr7Ir9EOA20Yy"
Content-Disposition: inline
In-Reply-To: <20190624212431.lopvs57iondijlyh@pburton-laptop>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


--gBBFr7Ir9EOA20Yy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> OK, I don't see the driver queued up yet so in the meantime I've applied
> patches 1-4 & 6-7. If you could ping me or resend this one once the I2C
> binding is in-tree, that would be wonderful.

I was waiting for Rob's ack for the driver, but with the merge window
coming, I will apply it tomorrow. The bindings are simple enough.


--gBBFr7Ir9EOA20Yy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0RSZwACgkQFA3kzBSg
KbbarA//csuPWq2D2CiyBGsoZLYkieuHP0ymfAs8ZVPfgAyLo7rYgEIkGsgxhxXk
hhWyHaKB7o+M8e/tRLBhjoyO7PZHR/pgzr4BUQz7S4dKYGmLFFgGPufFFywH6Xgl
Qn8PBk8x0ejS5GR6tTT6+qnMEIkMOon3J8yZIXqH2ue98AZLAV4UA5D5WLQqdpoi
C0bYaqu8nu8DObNvqt4GD7pN4GKU8kA8hczWfPvpDfjssBY8U3E/ISGmaQnYRLnh
6m8q1coyaR5JLRIQhBgvuZTfPX0KStOtVBJzn14fesZPUXwWsbca6PFKa2NCaPbw
X04N+ZsUyPNOg+Y9y3xLft25aqH33DIIFRvKhKN93B+fo/rLJ/2inl4Iko9Zbk2M
nh3a5zotDAy9zVei+KtO3jlzLbQGvfyjfgVQPJvecl0vxzV4B69UaOlI86Sgjzp3
CfnxYtR1KvvlMzIV+Jxj7fDaHokS+252AUqcAQA197wX9IM3XC8COO+ZlVQrb7WS
jfzNtuhHthivtOKAvjAu4CZquNXh+tL0liN4Nls1vCVcMDgH5HRLkwrEhIKZ4Nkk
c7vZeh/+J3/7R27vTFC0HDzzIzen73fIfdH4sRutIoNq/kzhfGxPcfRSW3sr3vnv
VPqM4xXYK1aqV0O6aq2WgwRbll/MXYP0uXaC0nJnvblGYcp2/z4=
=7JOw
-----END PGP SIGNATURE-----

--gBBFr7Ir9EOA20Yy--
