Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20C8E35A73F
	for <lists+linux-mips@lfdr.de>; Fri,  9 Apr 2021 21:42:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234196AbhDITmf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 9 Apr 2021 15:42:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234091AbhDITme (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 9 Apr 2021 15:42:34 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78A21C061765
        for <linux-mips@vger.kernel.org>; Fri,  9 Apr 2021 12:42:21 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id g14so949664qtu.8
        for <linux-mips@vger.kernel.org>; Fri, 09 Apr 2021 12:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OFTSox0XE2cJ5i/WptJgwAzts8ZiaiuohDM7xn7cty8=;
        b=QzAH9lGnFFR/geLOlo6UwmTeA+ENERKZCD53aFZL30TSNSc958Bm90CS+vkQ7A0j94
         fCd0Gp49sHR5kBJLAiTWqq2wQxk25fbqypvBEEAln2uPLZtRCg13hbHc7TdrQUjB4nDn
         On/K/dtcYBfWjp3yFgFFm2YYnAXyUrVP9dWjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OFTSox0XE2cJ5i/WptJgwAzts8ZiaiuohDM7xn7cty8=;
        b=fut01SX1FYyEfeETXntXRG43c3rt95sDw8aGr2ADjVKMG8s9DJPNH8bWw9G8ie2TYf
         /hxesH//SmXnxJkrmwRqbOFu2eyWPaWovvdPqdqmA0vw6P8dJzfsrP0dMjNcaechrQQ/
         x00q8zF2kegpSM7mURKb2VFHy3s08dHgBtwHxY5xQV568JDHeDdrIgwGnplVoj6qQb3o
         tTFtkLrDQOQyRNDErObpENrYhuVYU+TyHwJsHs0AGgMSsEJQFMmcMvFNJgSxw440bHZH
         6NK4bMyb4fF3kyjZTL8kuDhJrV0XIWWZSzFL8w5tOIAmlHJ1QBIJn5cpv53tiDHHhl/R
         Ra1w==
X-Gm-Message-State: AOAM530mY7gnUjyiq+JVsEVAwtjMy95tiK4jaYefuZDVrHygQUbv+BdO
        9CqvogJV4pv6bJIB7ubCrRRsAg==
X-Google-Smtp-Source: ABdhPJxzT4kyxdeN3XUBh/t6iPeWQS/mXIz5J2vliMosSIJvyhS7itIaZ3B61x1bhK74Hgkul5qdfg==
X-Received: by 2002:ac8:6044:: with SMTP id k4mr14162915qtm.4.1617997340386;
        Fri, 09 Apr 2021 12:42:20 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-140-239.ec.res.rr.com. [65.184.140.239])
        by smtp.gmail.com with ESMTPSA id s13sm2489647qtx.42.2021.04.09.12.42.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Apr 2021 12:42:19 -0700 (PDT)
Date:   Fri, 9 Apr 2021 15:41:47 -0400
From:   Tom Rini <trini@konsulko.com>
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Paul Burton <paulburton@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Simon Glass <sjg@chromium.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] MIPS: generic: Update node names to avoid unit addresses
Message-ID: <20210409194147.GK1310@bill-the-cat>
References: <20210409174734.GJ1310@bill-the-cat>
 <20210409192128.3998606-1-nathan@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xzsJsQN6Lm/oxwnO"
Content-Disposition: inline
In-Reply-To: <20210409192128.3998606-1-nathan@kernel.org>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


--xzsJsQN6Lm/oxwnO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 09, 2021 at 12:21:28PM -0700, Nathan Chancellor wrote:

> With the latest mkimage from U-Boot 2021.04, the generic defconfigs no
> longer build, failing with:
>=20
> /usr/bin/mkimage: verify_header failed for FIT Image support with exit co=
de 1
>=20
> This is expected after the linked U-Boot commits because '@' is
> forbidden in the node names due to the way that libfdt treats nodes with
> the same prefix but different unit addresses.
>=20
> Switch the '@' in the node name to '-'. Drop the unit addresses from the
> hash and kernel child nodes because there is only one node so they do
> not need to have a number to differentiate them.
>=20
> Cc: stable@vger.kernel.org
> Link: https://source.denx.de/u-boot/u-boot/-/commit/79af75f7776fc20b0d7eb=
6afe1e27c00fdb4b9b4
> Link: https://source.denx.de/u-boot/u-boot/-/commit/3f04db891a353f4b127ed=
57279279f851c6b4917
> Suggested-by: Simon Glass <sjg@chromium.org>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Tom Rini <trini@konsulko.com>

--=20
Tom

--xzsJsQN6Lm/oxwnO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmBwrfgACgkQFHw5/5Y0
tywsiQv8DJ4MGJ2Hg+DBmgGuc6jVnJx72/P02b4IvetoDvNTEcEMjHZ8ZxbQKhfM
6squHGIFqLQfLLJ/DC0EzvmFckf250Akbf5pFvOzWVHTKVNwBNBT2X3hfzZu8h9k
/j4LVtnkWbaYHInpBvf3WNW/UZdbAlhidlTjQs131JzgwND26W5zdN1xXrmFtujZ
HQn85lzWfJ3HOjx0kuXlCJM8hnP94WYgm6um6MaQHFgyDNd/oggK1lti7zaULC+7
la2V4YvcmlYhTbcUy5y1SO5va7Zad9hVNcQS5BqFWmgJ8dOXP7EjwPrYsqIYQn11
mzNmd4H7N9QYKhbndnjFEO0xvWdenzgQW6DJJr2UrbcaLAcr+q9mkY3eaBo9Btyf
mIBEdwUm5/3nSHqh71lXmZpAPbX/hYcKlbTm7cTz67MdLuypWuk6662DoQIFUnB2
o0l4YHeJ4Fowca/jiJ8XiNMfb9XmnbYYVExRtE/ufjDftxVli46tUN270V1fMSCM
P9a5xgN8
=gfSn
-----END PGP SIGNATURE-----

--xzsJsQN6Lm/oxwnO--
