Return-Path: <linux-mips+bounces-8530-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E198A8257D
	for <lists+linux-mips@lfdr.de>; Wed,  9 Apr 2025 15:00:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 708203A5C78
	for <lists+linux-mips@lfdr.de>; Wed,  9 Apr 2025 12:57:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A8E22620CD;
	Wed,  9 Apr 2025 12:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d4tGjyA0"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFD926157C;
	Wed,  9 Apr 2025 12:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744203458; cv=none; b=WL+1CrT7KBLY0RTM44RQDo2ZqZtBEnrlTV4a8m1XKIBGDqd1597FYM43GwJXruTyCamXKXxzbxWfLGE4/FRP9QbDJ0YFFx+Hn/M8T5AHvJPiXwGSe6w+obVNdXlLGwLLMUq4YqCNdxjnylf5BiF2Cj1YIcEMGM276nn9GyH0ovs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744203458; c=relaxed/simple;
	bh=m55S+NAzzTirpjscqGqB9PjBzrk5EvZCfUKQU0wol30=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZqhvA77/5ic6e/gWkHFtnLLXfyXYn338kmRv/XXPZqrv8SrSbxhi9EAwFJdsdNXg184Bj5GXlnDf6MgzycnliELPvbCvuRCft7KOoHQm1pVGaXPU06cHYOlspxEUyV0fvyf2nXfnRwmE27XmgjRH1skiUhbLFIQCYXhKl2O9Dqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d4tGjyA0; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e60aef2711fso4659337276.2;
        Wed, 09 Apr 2025 05:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744203456; x=1744808256; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m55S+NAzzTirpjscqGqB9PjBzrk5EvZCfUKQU0wol30=;
        b=d4tGjyA0kZIkCSeDmm0D4GyF9ZqiFCLbkGc12lN47oKwqvEakc87Bhbibj5HPedRFW
         BPNR1oEERp2x/LQywOkxWGIvmtvmZfZGSuf8dZCwVtcNntX2ti18VYdBwsaBRWoX/G+T
         X2y3sVYpXzJDTaezWpkniIjMztWs0mClcxafk5M6cza8FQMY8VuRJ1e1XUQGYSDKNW3M
         zEk00qfB5gUWjYGsgl/3NB6KuyD/WnArJkYZ4PtVjLqWVuK9CH0hkxPNyTQv4h+IvChe
         i5SU8ss98vNtayrh5amHn9tt4GHJNDlitYcuKBC5l0Pjt+ecuNX7NpGnHJzXVxIDzQPH
         qoKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744203456; x=1744808256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m55S+NAzzTirpjscqGqB9PjBzrk5EvZCfUKQU0wol30=;
        b=br1RVg9aXEW69w43hN707G4J+91Ff7CN8/mE014IIrxWdKRpCSbZn92xVCG7/2VWO1
         9DYKD4DvD0oEkl0epV2Lbc3I2EmW1fsJXqwxZVnNR2iE3nDdmTK4dhfMeaNAVsHGwlty
         h6XbXZtBy3l5XmTs9kwRxD2XYXs1ujW9o4bMN6Wi/VH0ZNJYCbGZrmDt/Z9CpKchrHnr
         nB17QtBFAOYpqg9qut19EOgnU1WTegKC1TJTweX0LSmtLvGieRsc7ZSptyI/YlBn1Pa6
         8tEfP07dJAOobUB4eW99tX4SIfWyhURKKK6CvSrYdPIWZxKsRSPuzgPF5uE8VGWAoeGw
         2aAQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9gW1SHlNUlcIt9q0CmfsoBeCQR51NvpLvtMhe5VzcJ155haVSIwZ/kWZYlJS0qJT7JU0Zl/93@vger.kernel.org, AJvYcCWUAtzjEalmoXbCS+K5GjLtxYLbG87VsHTkQ4MNYb+YsJRcbX2Sk2BwaykP6qdFHuB2RaCKEOaxCwOU74s=@vger.kernel.org, AJvYcCXH8+8TxMUkNIkd82W8adqF0x6A+QRjqlDXQc8EvTxlZfv3tfKOgiGyTCJduAa3dX9ZtxhnzvdQlpPhbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9Oe94wPokR9i6oLh81r9NB5pV7YjDS9hlwvN2l2AC18uUH7NS
	59K1KmYtP9ECGk2Py7g6xaHC3w8NGSczMIrE1lP6r0Fwlr6gCvzY8SZhci4KSPJUO95qGgoXJ1o
	96PAKB2mb6Ip9ociqk/JbvefrvFD7c0+o
X-Gm-Gg: ASbGncvwnlzAJJdX7VhZJw11O+K63I8IhYGiIfChSO06hD1QsrhVK7ofLpeDAvjWy7P
	YkWY0ROs4Saio1psd1/jC0KNy/EnTMiB8OLciee39V/l0OvIg6+Swe+0B1W8Lvdjz8CCpdlz7QS
	izJ0pKCH1kHJTkGNiTzNAR
X-Google-Smtp-Source: AGHT+IGQ+l4z4aKFzX2VxoQWfT7LBq40+um8TCunccvRuMrc0oqQgl9fK1Vpnx33pmIjgTku6cCbis+cQ/RLWgGZn0c=
X-Received: by 2002:a05:6902:2743:b0:e6d:e87f:ca82 with SMTP id
 3f1490d57ef6-e702ef49942mr4330709276.11.1744203455768; Wed, 09 Apr 2025
 05:57:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407082759.742105-1-thorsten.blum@linux.dev>
In-Reply-To: <20250407082759.742105-1-thorsten.blum@linux.dev>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Wed, 9 Apr 2025 14:57:24 +0200
X-Gm-Features: ATxdqUFTgDcrBPfsLWnsogV97LEjLFoF-_XeGrFOWVyfz3ZaUyRawTgrAILMb0E
Message-ID: <CAOiHx==cJicn3fYbf+yOfGX1ORZNgBwUNuV-2CNAxmdpn9O5Ww@mail.gmail.com>
Subject: Re: [PATCH] MIPS: ralink: Fix refcount leak in ill_acc_of_setup()
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: John Crispin <john@phrozen.org>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, stable@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Apr 7, 2025 at 10:32=E2=80=AFAM Thorsten Blum <thorsten.blum@linux.=
dev> wrote:
>
> The of_find_device_by_node() function increments the reference count of
> the embedded device, which should be released with put_device() when it
> is no longer needed.
>
> In ill_acc_of_setup(), put_device() is only called on error paths, but
> not on the success path. Fix this by calling put_device() before
> returning successfully.

I would think this is very much deliberate as the device is used as
the priv argument of the registered IRQ handler. AFAIU as long as that
one is live the reference of the device needs to be kept.

Dropping the reference of the device should only be done after
freeing/unregistering the IRQ again, which currently never happens.

Best regards,
Jonas

