Return-Path: <linux-mips+bounces-13170-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIKJOPfVjGm+tgAAu9opvQ
	(envelope-from <linux-mips+bounces-13170-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 11 Feb 2026 20:18:15 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A64911271E1
	for <lists+linux-mips@lfdr.de>; Wed, 11 Feb 2026 20:18:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 22A3B30089B9
	for <lists+linux-mips@lfdr.de>; Wed, 11 Feb 2026 19:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38F69303A35;
	Wed, 11 Feb 2026 19:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L+kXBFti"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4593B34F261
	for <linux-mips@vger.kernel.org>; Wed, 11 Feb 2026 19:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770837491; cv=pass; b=pqxLC8ziItsYaRtc1Wl/QnEH3mTtvIx7OaXQ04lS6/j+DBus4YLzSTSJwHii66uvYKQoLDXf14rNHB+TrD9vNLonTfsbH/cE/pcPIbEOzWrV0QdwR2GuJv/+Bkw518fe/l0rx4Dd11FtYy+1/6iAfmwu8CDTR/c8RVEhwT5l08Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770837491; c=relaxed/simple;
	bh=mSUvsOLBPzc6vhzvvkJOSwtWNsln4TW6SyRgPtEfQys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HOo7yuTL4+l6jmG+zYs1+upVL9hCEWwVUO7Y/JEcPmSDHr8C1AIOyEiETJsLTEBa9CkV2rLi44OLOFBZtRSF4haXAOmc3jkmP+CnTTRIS8oljoegpEPgOFLCUogzk2lfvdSM+jbNQ5+eOfEm7xzdnSyqf9mmDNWWmFGCE8zfVTs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L+kXBFti; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-794911acb04so57487827b3.0
        for <linux-mips@vger.kernel.org>; Wed, 11 Feb 2026 11:18:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770837488; cv=none;
        d=google.com; s=arc-20240605;
        b=YXi6J3xP0d48zWculheRNHIWzk21XrFsae2pD3HUBstxkAiHBiowXN1uHjSVvyYaX/
         drngTmHyKu4COHtbmSZfjr76rJVNQzg4SXETHUNAee4N/G5EHh1KnxlE+REfzzf/DRw0
         OrzeKnvQfd60r6h6nmkhJ86UmEgcwnuag6q0FOHDnKnqd2/75XPPGeraq3xZ8u1PlkX5
         Dq2MgI6KyI5/QugfcW0QwZ4DUIyvA76mEwFCLJtFfIUSiYLOZd2NNSqHiQ8ZzzRANlEL
         rKvn0e3dd2ovJEXH9PbLIrFP6naJex3oI3y7fYJPxnjlbc6SQ2RoTItFXJEF+fNwFWYk
         NUKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eJ8Hinkldj37UmV8RWHdFic0EX/FtpoR0f3LWqXQqrk=;
        fh=6KF02wPLyx0G+iJjTJcJgT/KuVGb1TMDVvucqmurHTk=;
        b=WeaO0qWrjrJY4AV+oWyE72Eb5BAG8ptSc8ylrU/0WF/I8fV6LByHVozunp1+Gb7qan
         th44ou8iSX4CGuYLf8KuWdlzw8XgKZ78qFuk5Ext8Orns5615zJ1RftdWowR1SRKRe2G
         YHhc1T2P+zb8eaZz3xpOop7VELsIPWF96l2T6ao5EFrFr/Hd8NWhlhv29BZuvBLbA/cu
         PMhzMORMv3pqUEyBO13jZwDej1L5sY8mzhOK3hrR3ViGMVJFI1zAo/ARz2SXtFeECATV
         VwEUQCQoU13O2DavPolUeodRtm9y3G2LvHmdUMNc2AIthuSKjktLtMoKY/ZTQgbqST4A
         jN9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770837488; x=1771442288; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJ8Hinkldj37UmV8RWHdFic0EX/FtpoR0f3LWqXQqrk=;
        b=L+kXBFtiWWVjO6eTjKKvs9xHpW0y/cj//xdSkA2qcjWH/DHOfNSbtl26jsnn0FypCg
         ZHNcEfnfcUphXEeZNBE6OFeyT4un13DMGfHkvJHSWpCMeZX5x0gM6Wcm5H03zHuFJRl1
         kxJ4iIM807m7mApchjSzYENA1VnfWHVyqqNu7CnZMdK/c52rf7fztnVvl8MGxLJJPcyc
         4Eb0hzYOeI8+y7lQ7pOw/scqB3DBjI6wUdTOWYukt5CWG+lGBKo6DNzunEwBSuDnCRQ+
         dsL/vfQ0AghgdBhGyDa3hhKbhk3FB8O+f0MJtyvw95Fv3g1FKwwQCp6Jhbr/aq7cgyXe
         JYBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770837488; x=1771442288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eJ8Hinkldj37UmV8RWHdFic0EX/FtpoR0f3LWqXQqrk=;
        b=LPLYAxAiH43yQlAD7Z8FZRbrFy2Z/cWB4Ze+Imfu6UMuYVKetNMwPA/K0Mp+uPppEP
         RNwPjQwih07tcHdwZRf9pwlhCIgl+CmVMzzBCxChtlkqCq3gRNCU94q05JwW3Vfo/ayA
         xgkdNNZLriiNfH8xdAxmKXg4733N0vlKdw3ZWOAy4igafPfN2yTLE5bJXgxCZQn6scxR
         AlECSs3LuOT1JJfZINf+eLvrhi2AJF40eLb/lKGcT6OkzVsH1S4zXSs8YEIkebglowSt
         rQcC3ptx+EAYWnINlv3jIkh/oDY08OkB3FSJDvtn8dmscyOMqqTdxAbmpMcOlrisu3LF
         NZOw==
X-Forwarded-Encrypted: i=1; AJvYcCX4bbB6/cB5jcPjRgdv4QJJQH5w3m4Kw3Qwhxif6Uo2BxMenQgOsqagfnXLBhwNlomkFDOCqSX7Qf83@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5Nn9JYw5Q9q6+oGyic1pLFL+ssMfPtgxUVGfTucEHww+4LDKD
	pHjHk7z/MclnPPYZS6D9JUchWUT/yBExzICwkqx85BYs5kAazRb34aKs9R+bcSXCRlk7nJFsZ68
	EpKoOYVrdwsNqW7XcBXu5cdDhlBMNK7w=
X-Gm-Gg: AZuq6aLR5r113CRUKUnVXSsBO/OThU5o6ZO4awEIzK6OnhgdwoFOpjNGUWqmEN2Y50g
	Hmbuc15FfhwDBhErk7eDyFgssePaV6t11K4shhjkS7bfA+Kg3IaFUds/8JVbDeJC8dN/XKMzQ0I
	zXu8X5QWMhIqVtBt9/yyI/CNhdj6r1R1RlXLZtLqKjKUSxsSZ0STX+qr/h/dl7uNf8jvmJhPrBH
	vS6etz+0h+QkIkpLodgItiyGUSeDv4WNbELskiZqg1BoqhhUbZj/kxEU7pC3rQRxRTaOl/xK1fn
	khrHw23MnX44lyWNys/5IBzRAIMXROXdN9k7QZG2/VTo2mfbyLZi8p+6xaIh3cTEE0XQzg==
X-Received: by 2002:a05:690c:660e:b0:796:6d82:10a9 with SMTP id
 00721157ae682-7972f0f7367mr6079417b3.15.1770837488040; Wed, 11 Feb 2026
 11:18:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211082246.41148-1-enelsonmoore@gmail.com> <aYxTsxNj2NLj8I6y@scops.dominikbrodowski.net>
In-Reply-To: <aYxTsxNj2NLj8I6y@scops.dominikbrodowski.net>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 11 Feb 2026 14:17:56 -0500
X-Gm-Features: AZwV_QirAT5dqvJFY2hc-_mrpgE0afxGOOhkyR09o0xEmrMTj7yegs3jJM3WVxA
Message-ID: <CABBYNZ+j4u3G4RcMxH7uswKGRpZpHbnAhG7=HRwqNsAQvVr8_Q@mail.gmail.com>
Subject: Re: [RFC PATCH] bluetooth: remove all PCMCIA drivers
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>, linux-mips@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, Ondrej Zary <linux@rainbow-software.org>, 
	Russell King <linux@armlinux.org.uk>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Eric Biggers <ebiggers@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, "Theodore Ts'o" <tytso@mit.edu>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Yosry Ahmed <yosry.ahmed@linux.dev>, Jakub Kicinski <kuba@kernel.org>, 
	Paul Moore <paul@paul-moore.com>, Simon Horman <horms@kernel.org>, 
	Casey Schaufler <casey@schaufler-ca.com>, Kuniyuki Iwashima <kuniyu@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-13170-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,rainbow-software.org,armlinux.org.uk,kernel.org,xen0n.name,alpha.franken.de,linux.ibm.com,ellerman.id.au,holtmann.org,gondor.apana.org.au,oracle.com,mit.edu,linaro.org,linux-foundation.org,cmpxchg.org,linux.dev,paul-moore.com,schaufler-ca.com,google.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luizdentz@gmail.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: A64911271E1
X-Rspamd-Action: no action

Hi Dominik,

On Wed, Feb 11, 2026 at 6:56=E2=80=AFAM Dominik Brodowski
<linux@dominikbrodowski.net> wrote:
>
>
> Am Wed, Feb 11, 2026 at 12:22:04AM -0800 schrieb Ethan Nelson-Moore:
> > PCMCIA is almost completely obsolete (the last computers supporting it
> > natively were from ~2009), and the general consensus [1] seems to be
> > that support for it should be gradually removed from the kernel.
> >
> > In 2023, an initial step of removing all the PCMCIA char drivers was
> > taken in commit 9b12f050c76f ("char: pcmcia: remove all the drivers"),
> > and that has not been reverted, so it seems logical to continue this
> > process by removing more low-hanging fruit.
> >
> > These three Bluetooth drivers have had no meaningful changes since
> > their status was discussed in 2022 [2], and are unlikely to have any
> > remaining users. The latest functional change to any of them was a
> > patch to bluecard_cs to fix LED blinking behavior in 2017. The other
> > two drivers have not had any meaningful changes made since 2007. Remove
> > them.
> >
> > Note that even with these drivers removed, it is still possible to use
> > other PCMCIA Bluetooth cards that present themselves as a standard
> > serial port via serial_cs and hciattach while the serial_cs driver is
> > still present.
> >
> > [1] https://lore.kernel.org/all/c5b39544-a4fb-4796-a046-0b9be9853787@ap=
p.fastmail.com/
> > [2] https://lore.kernel.org/all/Y07d7rMvd5++85BJ@owl.dominikbrodowski.n=
et/
> >
> > Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
>
> Acked-by: Dominik Brodowski <linux@dominikbrodowski.net>
>
> Which tree will this go through?

Bluetooth driver changes can probably go into bluetooth-next, not sure
about the arch changes if that would break some configuration perhaps
I can take all of them to avoid creating interdependencies between
different trees which would likely cause build failures in CI/CD
testing bots.

> Thanks,
>         Dominik



--=20
Luiz Augusto von Dentz

