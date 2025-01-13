Return-Path: <linux-mips+bounces-7424-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BD4A0C33F
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jan 2025 22:06:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3ADDE1885803
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jan 2025 21:06:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB9C524023A;
	Mon, 13 Jan 2025 21:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iqzk6UMi"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709E31C5F32
	for <linux-mips@vger.kernel.org>; Mon, 13 Jan 2025 21:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736802357; cv=none; b=gOm2l/q2RMlQNjUDnjxz/TpHW1Uy9EyiEpS/h3kDdJW0h0wr421wJ5M0OIg9liTqgREQZTC7oXZpxNNsBXB4pBhyRwiDTyp9gHx9DGGgpRjtE9lx0C1WHjnR5d3fsbTbGxsQ8/+Bjkq0jQMhjJ0MU1YljtVud68lZi1xzV7K5EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736802357; c=relaxed/simple;
	bh=b/qincRV0GyBh/KUrX2hzAQG8ck3gJnjrn98BCt27u8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=X12BKBJM6VipzxMjXtY7E3j4vvHbyBBIjRE44y+KSG6doIH4FcIG53g0+NDxCaZ1cfKWheGh5nuQfGO3YeAYXwAf7dl/mqqEYC32pd6+xljJ2nVL/f8bVBqmA/XxeMky05hvecfHjS0u+hxjkAhWqZs1o1ru+5w6f7K9gmxQ4cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iqzk6UMi; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ef714374c0so7154838a91.0
        for <linux-mips@vger.kernel.org>; Mon, 13 Jan 2025 13:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736802355; x=1737407155; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6B1TmtVWkL0TcqZvRRRTfQw292UobcGZISCvEeMbh6o=;
        b=Iqzk6UMifUlYielVYYtJ4NfZ2j0HRCb/onm6f5ZwUL2yx2XCWqc/EQJ4vQbKvPo/0q
         QkELc/R+832d1rzC9EimV9yARoNbpcKQbG6zein0vzuGZGxzhrwSL766CQlUmfS2l0Cs
         I2zkPX44JjOIxLZVRSvBD6on8j4djFhHXfuKMJLuYW5aUq1ypQgj/A1WFZQd5rlm1WpB
         8BR0oi3ZxGfk3PKTW0FODl3MyT3ER1IW0Dj6mE0Bx5hJu3pmdWnIg/aatiIIjxlL1Rme
         eUWHb7jJGrz5qijsLu6/2Kox/Ci+cRRn8gBd3WHSvDZsAET16nSSohM4dfRHhvRwIhgv
         yT6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736802355; x=1737407155;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6B1TmtVWkL0TcqZvRRRTfQw292UobcGZISCvEeMbh6o=;
        b=IOrhUywVRrwELyoBWbwTkI+qEVlKYQJwZ9J/uIXpixT3nIRpjZzCG4uiihADLnKRxX
         MhJ02tq0HKSKMfQsac5pQ1epqlGtfs3eqpTpZUhpPE8VO0q0Cg6yj8sr7/3/maB42XwE
         3ARQl1YdAlJvIBC4lAMyc3rPgXvTMYh7Kan7NgwkqAJuUxL652oWPSZa0GG9jbclugrw
         mpBf+zAWB9xB+mTIqtWPguL/2z9TcF2Bwkf8QnD0DR8M7P2I8Lep0k6XXy3YppOlFqZi
         sURry09pQMOJY1bYYqRwrR+Uj+p+SqBuMXtkS5qkD5u15jw7AhEgxP5wEAaRu+KqN8lZ
         tejA==
X-Gm-Message-State: AOJu0YxpLvWlVmUkb8UEP6UXJ/dNltSymrLwWdX6W41jrJdNaG7gf6Dy
	FkWgGfWqJLs9N8UhniDvf+G1Srf5KgTStsmjbnn0r+IIm2hToI3pPMLz5XPuuyd/jvs/NLncjGQ
	i7NBGhtzbfcDsU3WkAfpo/i8Hkp2+k0/o
X-Gm-Gg: ASbGncskkZgjujwfhtk9aIg+Syd55Gbw090XwPkxCYtZVB6yRQCNIu9OAW8E3zRHG0L
	A+p2zVkE7FuhnVc+t2rWWc1GQF6h4vgMZ7FUQVMGWYI4ufjpPuWBjKoYRmAViAsYvTTHyMvI=
X-Google-Smtp-Source: AGHT+IEpRCObAAJxqnBeVJdyRB4Zh8hT5O/ph2SaSAwMyUij9gFY0wxJxKMHDp+gV05EMbWLqVe3XFIVfHl57HwQ1kQ=
X-Received: by 2002:a17:90b:2705:b0:2ee:5c9b:35c0 with SMTP id
 98e67ed59e1d1-2f55836a9c8mr24126228a91.9.1736802355346; Mon, 13 Jan 2025
 13:05:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAAZ8i80XG5eXSOuL+u23g9qs-vuTBMhjfzdiyeVoQJxkjHLSuA@mail.gmail.com>
 <CAAZ8i80EzZsaOztcm8zUOvHH38D5DWgvUdHar0Yx8FN8k4Nj6w@mail.gmail.com> <CAAZ8i81Sh=3a0RGnGYELj4gROzY5xp5kkdt8F+CTnYC1L7Mt_A@mail.gmail.com>
In-Reply-To: <CAAZ8i81Sh=3a0RGnGYELj4gROzY5xp5kkdt8F+CTnYC1L7Mt_A@mail.gmail.com>
From: DiTBho Down in The Bunny hole <downinthebunnyhole@gmail.com>
Date: Mon, 13 Jan 2025 22:05:44 +0100
X-Gm-Features: AbW1kvYOwhO2kF4OeU5TDW-Kop4g9RdSsf4PrF2ni24puodggNnvu4OZk0nU5cw
Message-ID: <CAAZ8i80Cbzvw2zcGmbev_W=11-2i=TaDcjWiJk97mw3LJCbeGA@mail.gmail.com>
Subject: RB532A, kernel out of range
To: linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

hi
I am compiling 6.* kernels for RB532A.
On tftpboot, the RB532A reports "kernel out of range"
Any idea on the reason?
Please let me know!

RouterBOOT booter 2.8

RouterBoard 532A

CPU frequency: 399 MHz
  Memory size:  64 MB

Press any key within 2 seconds to enter setup..
trying bootp protocol... OK
Got IP address: 192.168.1.41
resolved mac address 00:02:8A:26:B2:1C
transfer started
.......................................................... transfer
ok, time=2.76s
setting up elf image... kernel out of range
kernel loading failed

