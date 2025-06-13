Return-Path: <linux-mips+bounces-9274-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 379BAAD84FE
	for <lists+linux-mips@lfdr.de>; Fri, 13 Jun 2025 09:53:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6FFD1889224
	for <lists+linux-mips@lfdr.de>; Fri, 13 Jun 2025 07:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2C0D2DA762;
	Fri, 13 Jun 2025 07:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WtfSBnNC"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AFA2DA75D;
	Fri, 13 Jun 2025 07:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749800306; cv=none; b=jBRlthqHM8HfPOqSVIR6Xkv+rR89UGuZba+B8DIBztF6GcqiuLGFa7LmN10SDVwpYV7hgczpGIzGCkVkK4N3YfS1aDC2rgEvdQTeyLGTcDdC/Qcq/F8m/kQ7eFIQvwjKV0Jgbw/yWY0q1Nq/tIuK2/E7zUt18NQtCZt3lzjVWHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749800306; c=relaxed/simple;
	bh=Zk9E7B0cLEq92YUYEu39PlPpaS6WCK5qgzp4ebsQ2B0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iqOZZp9+7e8OYsyLjKas/o0eiKuoQlt+JOn/Y2GbRcVRP2a5gWa1vcgt3ziOwjCajDixd4dyVS+dD/PK3s7GQn983zYo/vxQyFCqzgtkbn7DZUJijhNF1qFPWhD+YaSIFbbQxetX+p3I03TfcNZSw8Ek+xUFZNjPKO9xr85GA8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WtfSBnNC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA6E6C4CEE3;
	Fri, 13 Jun 2025 07:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749800306;
	bh=Zk9E7B0cLEq92YUYEu39PlPpaS6WCK5qgzp4ebsQ2B0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WtfSBnNCUmuYf5NcrAgqVTt96tHIUKFJjXr7PvpldJPScV0tuOvGnajWm1O3tZXkO
	 nUOYkh9/7JmQb8F0mP1BcS18U37CM95+rlMGvYqivLv3nUq73wkPXM9Px3rBBvzljy
	 Frwe/AcLm5NwMOuO43bPX8iKA2Z/g8Xiyo7A4AEaRFzzia45NqUH2jwPOhxX9zH3rE
	 BDWaV8f5tyEjPv0Gvfeep2/ETr4Y5PgqniqLy3mbJnHbhzjoE8R8+XgJO8Bav5IvGl
	 atQUCp6R4L243D9DJeMrDkwWUS0sZVeix0Zke6AclHXAJWjg3ZH0+q+gNdIlQVoc4M
	 PgnnFOti0q+Tg==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54afb5fcebaso1859816e87.3;
        Fri, 13 Jun 2025 00:38:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV2yzUBCA/fHxiOBgS+4vXDQhgZxrv8BHMuaeCC5t+fcySygFibJD8eJNEiCeNhlT4ZMLJGUQAXbNgchw==@vger.kernel.org, AJvYcCVhnlTYaztUgP5gBBy96DVeIfzMxN0QIwKzbKBssk5EskcgzSVhZXqR/SQH1bf0Xmj7o4QZ6oJM1xC1Ljo=@vger.kernel.org, AJvYcCW9N+i20JBbQjTQG5w7hTxwWQ03pM555iCDnCqVU0XSeRJS0L61M1uZAeLJlyXdn3ngzatETz/GnS3JODRs@vger.kernel.org, AJvYcCWCc25JUqNY/tZBTb4arH0UzZD0vXoJO1zOh4Rz5A8sNxv+0QtySN3+92RGUtORibNa/EHZ/bN94biGyA==@vger.kernel.org, AJvYcCXXtL8umL8YUZaa8/qlrgCzZ7FRFIZj7Q1wOwFD+Evy+LjLtJKFMe4DtXmxzr+TOPcxhWjy1Ed2s5JN0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDS1q+aj8N7fCbzauCm9HgFC+jwLqRwir8v918oaYgvyG5bV6P
	G3YJyKnmymQCQkpw2XtfbK4iUhICpu6f4GFbd/rhP6+06SoMECLMQN6VYBN9e07waXrGmV7+nD9
	GWgC6XmMmGyFqQnzTbdrA8EU1kocwIn4=
X-Google-Smtp-Source: AGHT+IHlO4hZ7n7uTJh4T8Gyrwm4r7eJzxuJkITnqDB9Kgj30CFlF7REbfDIhM5d+j/NBrv+1KJlS3nHK1VNyHiQv00=
X-Received: by 2002:a05:6512:138b:b0:553:2190:fef9 with SMTP id
 2adb3069b0e04-553af97a5c9mr527698e87.34.1749800304328; Fri, 13 Jun 2025
 00:38:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611020923.1482701-8-ebiggers@kernel.org> <aEjo6YZn59m5FnZ_@gondor.apana.org.au>
 <20250611033957.GA1484147@sol> <aEj8J3ZIYEFp_XT4@gondor.apana.org.au>
 <20250611035842.GB1484147@sol> <20250613053624.GA163131@sol>
 <aEu5cyDOMcKteW_b@gondor.apana.org.au> <20250613055439.GB163131@sol>
In-Reply-To: <20250613055439.GB163131@sol>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 13 Jun 2025 09:38:11 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEDCRfCgvtuhRc+a=m1kVt-zkcCqi_=_WOFTmt4Hz2gGg@mail.gmail.com>
X-Gm-Features: AX0GCFs24ZatfLP--3A0HdZVLkk0PxiYFRdOEZErG1-T31ygmhYk5yo9nxe3t44
Message-ID: <CAMj1kXEDCRfCgvtuhRc+a=m1kVt-zkcCqi_=_WOFTmt4Hz2gGg@mail.gmail.com>
Subject: Re: [PATCH 07/16] crypto: sha512 - replace sha512_generic with
 wrapper around SHA-512 library
To: Eric Biggers <ebiggers@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org, 
	Jason@zx2c4.com, torvalds@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Jun 2025 at 07:55, Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Fri, Jun 13, 2025 at 01:38:59PM +0800, Herbert Xu wrote:
> > On Thu, Jun 12, 2025 at 10:36:24PM -0700, Eric Biggers wrote:
> > >
> > > You do know that most of the sha512 asynchronous hash drivers use custom state
> > > formats and not your new one, right?  So your code in ahash_do_req_chain() is
> > > broken for most asynchronous hash drivers anyway.
> >
> > Every driver needs to be converted by hand.  Once a driver has
> > been converted it'll be marked as block-only which activates
> > the fallback path in ahash.
>

Perhaps I am just slow, but could you please explain again what the
point is of all these changes?

Where is h/w accelerated ahash being used to the extent that it
justifies changing all this existing code to accommodate it?

