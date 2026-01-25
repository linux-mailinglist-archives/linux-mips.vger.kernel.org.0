Return-Path: <linux-mips+bounces-13006-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJc+MyKOdmnkRwEAu9opvQ
	(envelope-from <linux-mips+bounces-13006-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 25 Jan 2026 22:41:54 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F59F82889
	for <lists+linux-mips@lfdr.de>; Sun, 25 Jan 2026 22:41:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F13C430067B9
	for <lists+linux-mips@lfdr.de>; Sun, 25 Jan 2026 21:41:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A2B830DD30;
	Sun, 25 Jan 2026 21:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oz+GZocd"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6381330DD01
	for <linux-mips@vger.kernel.org>; Sun, 25 Jan 2026 21:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.193
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769377301; cv=pass; b=dj2X9g7Be9Dm0kmnFixPvnJIB9WwBz1Oryxmbci09iCLsMU0VqBQuiE37/RL6vqGJByq5rHbMrloccFjiYc1a7P9ktRgT2obR2KOnx7+a8KeWep5bODgAoO1VZosnD5TFY4CUkCdx1BnjH+i8Io51Tv6Q/Ishj1NRebDurpdLsM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769377301; c=relaxed/simple;
	bh=CUJyJdkPJFr+qzK/2iHOhlqvG4D2dajcsiQFu5TyavI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ggKbaVcr1JtRz24ShP21NomU/FYneLHMQs9OcTNdEVyX8m5tfPOLnJTlRleSbaAY5R1R3nEWiExwSunkAnB9iPvjAixWgYt5EfpICBOa/h18H+X0ueKjmVO95o9IPyex9sxoXB+TN85l5m07V73/d7hfSyROiOKdBCCrMiy99kQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oz+GZocd; arc=pass smtp.client-ip=209.85.222.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f193.google.com with SMTP id af79cd13be357-8c6d76b9145so506462685a.2
        for <linux-mips@vger.kernel.org>; Sun, 25 Jan 2026 13:41:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769377299; cv=none;
        d=google.com; s=arc-20240605;
        b=HsDwvWq1pweBsQ8pYIZWKM41EbZ9by92DjTgEoZTDj4MEQRHsOVVGMy71pscQlYX1q
         WTMw4G3sX1ZTGk3jgbLenj6szFtBtCXt7z9ZH+kcU+eN/bF/Lak0KSMRe+C2XKuAVNqP
         dyk2SH5jLZBrsgfbixplBvohsQY1YR7LEhuFmev27/6zqgUW9mzmZayX4oiIbNz1a0Ty
         WSUqyAHfoGSlFUqg1H8yMVK1m+NfVnOPf9WlnmkyOF0Rz3bFHe5Kk03HEHYtW+XD4xD/
         J1LhBWfbvvhTeFnxlFz8dxGQosggBi96ZHnEhGWYIm2MrzolbgHDQ0zatcI7RgEP5kX1
         2pAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GghexN9v9Tl4rIdwgV34PPZYEF7bLOxK+iXkN8X340s=;
        fh=Z7kVfh1fBwMn2F+RimxYAPhw2FKid1pKNUpMxqXi1ow=;
        b=VscZCg5FGuvakcocHBa02+HUafrPYk7i7loe7EncxDH4oFpHvY9zHAKO9EOgCWqtaJ
         zDzlQTNzTGXvppl3cnyJZgktAY+67pli8X8u/5NWbsGZ9xRGJCJT6Vo1idJOrco1rYH9
         CglCD9VcTFag9ECWZpQDO630gxFW4GFJc1NAAjMhWs8FY1bFEDFTQc9Wf4JvVtn4o0K4
         +H8oHBv9y4Nvm7j2PLT2flSHdYjtb4pqs/e8iAaVuyz2uoRPU3nXlaGoojNQPA8UgT99
         vi6zKdnnIyp32wXqfgCI/WpNnxXm7bQxwouSc0sF7Zr7v88ch+VnVpxSf884zkGBzV56
         wiGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769377299; x=1769982099; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GghexN9v9Tl4rIdwgV34PPZYEF7bLOxK+iXkN8X340s=;
        b=Oz+GZocdZ0Wkk/cWMts6zOjcPWNmBO5xBBM9MOAwkiL1mH2ctv6qa3qtIHxXnWvYGX
         lQ8OnZnlMGYjJWA90QJKpFuAT9rw0GsMa/WUTGhmu6yE1E7H5Slv20GaS8ZnQoWHupMD
         JQWUO/HXy06Zdxxm4VymK/bnQQsX3W31TIrldyq3srQz8pcdu9gej0eBM/oYu7O941U9
         Hpw+b0tUh1Ihin3b+KxVEx+kMfe0SDAiBHI5uoylKZc8kg/422lkrzxP+TI1CuawY5wc
         bAmf2xAGtxK868EgTSD8ppKj58OMWiWUHHYDJy+gbkNbS2lScgllC9xF9IVK792LJo2q
         6ZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769377299; x=1769982099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GghexN9v9Tl4rIdwgV34PPZYEF7bLOxK+iXkN8X340s=;
        b=iCLxLa5SSWAH+fUfzOkZAXOCCcAnj+rB0PMQ28cNN+gj9WB3BX+9+puORJNVJa4gLB
         TUWdvTISHv7sbScffP5/91drjBzJQ99F4zbvJLgat+0xZO8sc3gi+yvCOSEyB+Z9PHdW
         E7mwyFi783EpGj/2n+iIcIk30FLGvOQw+XGPr+7wp+NtCaAY/VwNxHiisq9GXsXb/mKU
         3g0OHsMBtT17XmNUb2hgJvPwU7Uj/rLk8aaD7dBiyCsu7UkVbGzGTSsFs7oUQbGv++Sm
         D5W6REarzGZNCdNv2pqKTB/eun7gDQ+Cm3ZuNXAibtJKOzqdRJjdP9/S/kPSy5TeaPB/
         ryaA==
X-Forwarded-Encrypted: i=1; AJvYcCX7tr75lKBZh5Fcn35q8KwfdwtwimER8Z4oF461TYXUYNQvLnGL39my55aVzqnj/Nv5pHn+e8gK72jR@vger.kernel.org
X-Gm-Message-State: AOJu0YyGpnt1ydGbNG2dhc1xtp3kSNtecx/18Zr0ttfDUCP3iXggPVmt
	F2oCozeoPEXliiL57jANpTcoRVeEx+S6vKHwHbqQ0nAzyu7J3RBts7KK9eSo9t+DQMedNEoCEgS
	erGOIbEa4LqzvdNSZlL5Yt5WqUdYUXmY=
X-Gm-Gg: AZuq6aIv4NbvasibTRgwQ+D39ijF+iyn/Cqco0VuZi8gGHQduLkKha9hNnkRBt8PVRf
	XfxU/x4COZf6bQesj6cbxmGsZyLtZ0WJg7j8VeV9yU7oau8V/bA9NOzCWKBzfmv0ocv31o3/DhQ
	QIXudTq0U5zEWLbwiFfrK3Uj/PgtmLeC7B7Uz9OGjbKgJKC3a0bUGRu58AcZW+rc6bBjGkkrDJl
	16amEf4pPu6+YcivOJarl4TVdkYM7elWpQJ07f5F5txZw/GqHWHo6dMi/F/4p2EveZ/aLHgjPRA
	3bXLWu6m7H66lm6mF08iCLxgffPtDvRmD54QOqlG9/w/2VNYGq+HESJYhiBg
X-Received: by 2002:a05:620a:172a:b0:8c6:ac96:f5e5 with SMTP id
 af79cd13be357-8c6f96e6cdemr280705485a.83.1769377299320; Sun, 25 Jan 2026
 13:41:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CADkSEUjyXH74izTrsfhdAjh=n-jnGx=tXbqPx86M9OYqjXj0PA@mail.gmail.com>
 <20260125181125.GA209392@bhelgaas>
In-Reply-To: <20260125181125.GA209392@bhelgaas>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Sun, 25 Jan 2026 13:41:28 -0800
X-Gm-Features: AZwV_QjfdD5BNg849bWJiQdew-9LUzyZdNbSnd1c07lERk8YVDkD-hDCRqejbYg
Message-ID: <CADkSEUiwQTq=175VZ7Trm4Mf2o7_ckcAkPouoawC5s4oumdcdQ@mail.gmail.com>
Subject: Re: [PATCH net-next] net: ethernet: neterion: s2io: remove unused driver
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-s390@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Jon Mason <jdmason@kudzu.us>, Jonathan Corbet <corbet@lwn.net>, 
	Linas Vepstas <linasvepstas@gmail.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	"Oliver O'Halloran" <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Danilo Krummrich <dakr@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	=?UTF-8?Q?Martin_Kepplinger=2DNovakovi=C4=87?= <martink@posteo.de>, 
	Pavel Machek <pavel@ucw.cz>, MD Danish Anwar <danishanwar@ti.com>, 
	Mengyuan Lou <mengyuanlou@net-swift.com>, Pablo Neira Ayuso <pablo@netfilter.org>, 
	Huacai Chen <chenhuacai@kernel.org>, "Theodore Ts'o" <tytso@mit.edu>, Takashi Iwai <tiwai@suse.de>, 
	Eric Biggers <ebiggers@google.com>, Madadi Vineeth Reddy <vineethr@linux.ibm.com>, 
	Ard Biesheuvel <ardb@kernel.org>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	Frederic Barrat <fbarrat@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Dong Yibo <dong100@mucse.com>, 
	Lukas Bulwahn <lukas.bulwahn@redhat.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13006-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,kudzu.us,lwn.net,gmail.com,linux.ibm.com,google.com,davemloft.net,redhat.com,alpha.franken.de,ellerman.id.au,lunn.ch,garyguo.net,protonmail.com,umich.edu,linux-foundation.org,posteo.de,ucw.cz,ti.com,net-swift.com,netfilter.org,mit.edu,suse.de,oracle.com,gondor.apana.org.au,linux.dev,mucse.com,iscas.ac.cn];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[62];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[enelsonmoore@gmail.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5F59F82889
X-Rspamd-Action: no action

On Sun, Jan 25, 2026 at 10:11=E2=80=AFAM Bjorn Helgaas <helgaas@kernel.org>=
 wrote:
> What is the value in removing the IDs?
>
> The values can never be reused for new hardware, so removal doesn't
> make room for anything in the future.  Unlike the removal of driver
> code, removing the IDs doesn't reduce complexity or improve
> readability or maintainability.

Understood. I'll send an updated patch which retains the device IDs.

