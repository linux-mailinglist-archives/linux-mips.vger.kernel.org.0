Return-Path: <linux-mips+bounces-9824-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 35701B0721A
	for <lists+linux-mips@lfdr.de>; Wed, 16 Jul 2025 11:45:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39A1F3A87AD
	for <lists+linux-mips@lfdr.de>; Wed, 16 Jul 2025 09:45:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F7042C158E;
	Wed, 16 Jul 2025 09:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QebFb0+D"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EEC273D9E;
	Wed, 16 Jul 2025 09:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752659151; cv=none; b=E0qcYbkYoc5cZAMKKJzDeEPS9AZXCo3RzoCKfuZMYWiTQnz6o7mvq73uhjKo+5fy6IiEPgyATVA8Q93lvrMcboon/rsQCTPGGcH+ZjP4fKz45TipIv6jGO9NYlgnBukmrA4GfSr3dyr5FvEeiO18qgSpAD8iZXbVag8IWbzRnPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752659151; c=relaxed/simple;
	bh=ib4v895jWgxSm+mNVCMPRRCf4CuxSGhOx0k/DpjpzS0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g5axZ9vdQ9TC01bnYp3AgNPaiW+XL7ZuZFjL8Rp8hDUKFhq0Sd3fIPMaccD+qwU++AE8bp6rhbxA2rRl3wrCnnnQhABuflsrX9XxjAl+nORKfW6xWHnOtSClLdr5gSkShatAwxplz5B/34o0ItcpdVvWjvSf9A0NZp6tvNOrwNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QebFb0+D; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e740a09eae0so6432302276.1;
        Wed, 16 Jul 2025 02:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752659149; x=1753263949; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S2lJu1PUW1cuTa8j8qT1jriWuKixRDa5iGkg98uYZYw=;
        b=QebFb0+DO7NGOr3/52lAnyMRHYmuJqbhY/DARSB4FsZuNshjLPBivT4XrBY+QKO2D9
         AV8fBzWnLckvtDyD50VrSkmn5mCLkldZEyKuItW/AQ7oU8JwCqBTXSjJnknsN+D6Xair
         8omiM1LeCTtZEELoj3cfYWe+Blu0X+MzsHCNq+mQGy95xXkUPmkYDHjb2dAeCetizyDX
         QFGan+eEUNg78bxBFjoNGS00B98IaWTU5hvgneDm6LUPe5t3iAgnK0YV7xWs09ucgbXM
         IJZFWKzgNVRdc8bAWWU9DVaubpOxFGYrFzNYUnw0SFoxjj0i3md1XgeEaltHubs+dG2W
         nJIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752659149; x=1753263949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S2lJu1PUW1cuTa8j8qT1jriWuKixRDa5iGkg98uYZYw=;
        b=aaWM0SIwEPvgj3X9Px6u0IpJjVrSfoUs34nBNh54GI32aTdVLqK90n4s2HR/kcEbj7
         vufm8NJLQV5TG0vWrdmYKMaIO0RJCpAmJGCtKgHoiskTWs6VYYTypCAgltq86HhOA7dZ
         EHsclsNljA0dTVr9JPshgIyeyqJuV4fkx/xIE7OyegZ0nNa6iHEcOe8jS5+E6BlARw7V
         OKQvTZh58Bk/qf+g9fI32AiKByUVj7efnKFhrxP+4XfoJUrTAUpVcIDOuGdwU5EN+pl3
         dNDKhDlMhjIDdZL4p7wmy6pCv/CHI+1sSWpIbyr/m/Kgx1dtI74/Yh4ZO1fT7jUYNU9X
         CVyA==
X-Forwarded-Encrypted: i=1; AJvYcCUAjivHHN06hci60U93Bdn6hEGTYpxK/I39ekLflPI7Pqf74Vc0DV4c/V4Ph012vtVrzpg05e5BDaJa@vger.kernel.org, AJvYcCV7OlaNkxX6LYb/mUfVbX8AumV7oDY5soNzxYsRyr55B87ZByS8WHEXb4k6DLnfqQOpSxKZxi/V+Hqpv+3+@vger.kernel.org, AJvYcCXjE7BP1ZCFIWK5uzFp74Wv4aWTWihYxqeuUahjzMrlWpRcJyy6Mqcp83scV4xb2KscVc21h4aISo9fyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOeFfHs8l0epphf0bIT3W7tABttMXZcHxWGSkwtu8qyVTyoimJ
	BBm9h9uXyFjPP4K/QOTIW2mb1JGVV8AlJAu/7eASqlDCfc0AKeG6V/bcq0JL+G3KP4RB1jlRKY7
	ohV9EO3pW7b3/nKRqjFsg/m+lTDbQc5YZ/WUtHSc1Xw==
X-Gm-Gg: ASbGncuMnOSTLAM42Zfj33K8ZTFsh1PsaeUwUurbz86WxtQWj0mz4mX6npfkNMkhEJg
	LoNiYPNk5jskGw/MuwUOLFQpDReXU4+yfCVws7Qv+PFvnzeytz2iWRvKB7RFPCaC6Jk/e/rDyIH
	IIJAdysHgzW4FbMh6P2fb+Xg5KSxzZPrwXI2EbpJaMIa9i53i7xJ4wxIaDPOiwmnZae4E5AXT4W
	/L9RsxY
X-Google-Smtp-Source: AGHT+IHFzjb2lZBeq0vcW38r3st56S+gBZuw/xv7RdKkGX0pEIrU9nEOqtohAAdJwXvahlak22+qQcRZQJgozKpQZgo=
X-Received: by 2002:a05:6902:161e:b0:e8b:908a:a932 with SMTP id
 3f1490d57ef6-e8bc1b9086bmr2841393276.0.1752659148649; Wed, 16 Jul 2025
 02:45:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250709-loongson1-arch-v2-0-bcff6e518c09@gmail.com>
 <20250709-loongson1-arch-v2-4-bcff6e518c09@gmail.com> <20250710-wondrous-copper-bonobo-b11dcd@krzk-bin>
In-Reply-To: <20250710-wondrous-copper-bonobo-b11dcd@krzk-bin>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Wed, 16 Jul 2025 17:45:10 +0800
X-Gm-Features: Ac12FXzOY9yqLfALZsN0SFfmS7-jXoun3VBZAodX-KGknn49Xrz9WULq7FGDGqc
Message-ID: <CAJhJPsWq0mPri2ZcZkufvnLEnpZ9A_FOv5kE+vpER9vw8vLsSQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] MIPS: dts: loongson: Add LSGZ_1B_DEV board
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 10, 2025 at 8:29=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Wed, Jul 09, 2025 at 07:05:55PM +0800, Keguang Zhang wrote:
> > +     aliases {
> > +             ethernet0 =3D &gmac0;
> > +             ethernet1 =3D &gmac1;
> > +             gpio0 =3D &gpio0;
> > +             gpio1 =3D &gpio1;
> > +             serial0 =3D &uart2;
> > +             serial1 =3D &uart3;
> > +     };
> > +
> > +     chosen {
> > +             bootargs =3D "mtdparts=3Dls1x-nand:16m(kernel),-(rootfs)"=
;
>
> And if someone wants to partition differently? bootargs rarely belong to
> upstream DTS.

Will replace this with a "partitions" node.
Thanks for the review!
>
> > +             stdout-path =3D "serial0:115200n8";
> > +     };
>
> Best regards,
> Krzysztof
>


--=20
Best regards,

Keguang Zhang

