Return-Path: <linux-mips+bounces-12892-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7A5D187EF
	for <lists+linux-mips@lfdr.de>; Tue, 13 Jan 2026 12:31:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8A9033004421
	for <lists+linux-mips@lfdr.de>; Tue, 13 Jan 2026 11:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB21038BF9E;
	Tue, 13 Jan 2026 11:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rc+7fh/u";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Oh0CiN9y"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FDE346ADB
	for <linux-mips@vger.kernel.org>; Tue, 13 Jan 2026 11:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768303842; cv=none; b=L2MzYQxInzAfD0Ke6BPYH5qyOxn4Q5XW4C6dld8Qm37Zw3qXG0032S011SlTxbNtwqOt7sZXpz5KgL42CkLmRulAc3y2qsIz+ra8freWxpZtWPaNKniZ8eEgaVx4q3t0U+V5FG5nXoI/3I1T4SYBTM6Qbcl6GcbM449YWDyGuxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768303842; c=relaxed/simple;
	bh=GFbBe1FKiFwXNqlrC/vrxH7BKrvDogX+HkFJiNJXIbo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z0mV+PNRC4fkLh3ofXglfDwFxNGE+TO7Hx5D/LVaY3XQT7DXzaASPEqDe2LlTYjiw5JHQuTeiXqy9Ie3iASA1amn0VUD26Ghk01r30C2SO1TxyQrkwY6Rg3+p+L7mbvvd1wqI0yi/GjHsbEsw8rwbBDgJF8OdSPEnZGJbkW8IR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rc+7fh/u; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Oh0CiN9y; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768303840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6mZitFPZXaFAwgzzbiC1drztWEtu5YGVE+S8D2GI5aA=;
	b=Rc+7fh/usF5P65kEan79nOZO8qsYdJoKJdpW52yo1iRnNjIZ2fI5CXfgLex+ar/8+YXMOU
	FRxyosdci9xHyPNShU/xn9NDy97/1M5luT4TyA1Jbdm+0F8XOuc3ZXdZtcww/16Zr/Zo3O
	1DfVxy9QzpdCQPXUbUxAfqyIwV/nMgk=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-411-ErVifvcWNMOoykqXZvuE8A-1; Tue, 13 Jan 2026 06:30:39 -0500
X-MC-Unique: ErVifvcWNMOoykqXZvuE8A-1
X-Mimecast-MFC-AGG-ID: ErVifvcWNMOoykqXZvuE8A_1768303838
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c52af6855fso26357885a.1
        for <linux-mips@vger.kernel.org>; Tue, 13 Jan 2026 03:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768303838; x=1768908638; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6mZitFPZXaFAwgzzbiC1drztWEtu5YGVE+S8D2GI5aA=;
        b=Oh0CiN9yXrjdAqrVC7T6WR4rjjHUEZP9QhtCiDipfiZpAJgT8e5T/g0Bb4/1gHryw4
         nC4c7h8hpoG/xTY5Z1eOrWcs8BhCm9TEeXMtkXP+BvurSkF7+QpbAvbVw6bEFA5MA+m5
         KMiUa8qyKdvt5d9jKGF0TizYJWhaiwygNV0y5AtbPXEW+/8gMKPJcR5LoYcT4clno68D
         gt54KYN+GYasBcNuvKZU96Ej8xY67du3GNxKyGyv5YqDDYLWGL4ybslliioTNqcd6OQi
         DqgbYNMzJFP51CK2JxM+5Hj4wfy72erUvgcmehtLgU1/S/Iw8+v798YiCHi6tJldFs3g
         r5mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768303838; x=1768908638;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6mZitFPZXaFAwgzzbiC1drztWEtu5YGVE+S8D2GI5aA=;
        b=YPCw6tzQT6b0/AZXV7i5oqeRRuyG0T1K2Ax985vGgtCvPQFzY10lBKzOttY0eNXsIv
         6iZFj6SS0PIjyyjkUb8DSQagCrc76Hm12rY58kroRsesEUIO6ppYhZmdS/XnXIyFz0iT
         FZO2NY2TXacDCob55OP2YdmjC2whUPLC/rp6fIC072Di0qFHQsY6MVfKeM8OJerkIYzi
         UaGk4L3xh8sRbepgyx5WR2eX3dmvxvrxtrojoEBjzzMHWaLrstxUUNz889gM8RQubvr6
         hJE+2s/0LTADiQUdeJwG0uPTrgaQd9p7lMkZ5tuTdLvEtETPlizgT4b67vHIrv5F7UD+
         cGjw==
X-Forwarded-Encrypted: i=1; AJvYcCUZp0kthagVw4tvXWuZB4/nL2AsHx+ZHXbyOLlPSijNu0c9DtMqx6LF/nBfUJy7HJamO2nTfBiUFkVk@vger.kernel.org
X-Gm-Message-State: AOJu0Yx17td6zLQ/g5LYp8Ejn0d5hHctBYpu8dtOZ6GMil8fe8mtly8v
	3l+mISXWKTCH319EmwGpUR9lV405ZkZu2c9n+sUWq/uwiHt1lBjmPWRxBRD+AAamCA4TRy2Fpyc
	WpjZhYKDm5hfqwj7KLm+lqD/sC8HE8Nm/tx5ydIXCfWGb1yHe464Ixs5K26Xh410=
X-Gm-Gg: AY/fxX7QRZO7u6dGaCe8xH77x27ZcLVmsDUosQAHs9JBnpCvuJFwQKmg4ZTCWpxb3sh
	8hGOHv7MlQS7P3n76rPIw8iddSAF281j7BAnKbK0Meu0shGCUTFetKqTAzVkw7CGYl2OAq4Xgki
	IfqrCZx31yPao6Szx805hQe9H0rORbtnVYKt7P23T2fwNuCPyvoT6alimJKQmBqNE+8D8nNGHLT
	6IWM8V3zmNlum0996Eo0nZcYGnCTxdbqgnwHh4DDRsZPciZYVbyd/0auU+tz4MqMuLmjc7W6hL7
	dOrIJ1rvDBHZjSzQDfl+/1AJBAwDtjNyF/1dUxFoNU+qQQOmoZdi17ekDgfnBVp2/ZNs+3nT/cY
	dwjW6viXmvsWF41Y/PmpqCZWzw5qUb64XQZQ6oCk/NS5B
X-Received: by 2002:a05:620a:404b:b0:8b2:d2c9:f6a with SMTP id af79cd13be357-8c38940d09emr2936023485a.89.1768303838438;
        Tue, 13 Jan 2026 03:30:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHBP/cb2/Ccnmcjxtit9ZlBPwyv14/S7B3W8jqKWuMSTmdJjyszN2LnYWy4PzHWa3vlkgJkoA==
X-Received: by 2002:a05:620a:404b:b0:8b2:d2c9:f6a with SMTP id af79cd13be357-8c38940d09emr2936018485a.89.1768303837929;
        Tue, 13 Jan 2026 03:30:37 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890772682besm154938746d6.50.2026.01.13.03.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 03:30:37 -0800 (PST)
Date: Tue, 13 Jan 2026 06:30:35 -0500
From: Brian Masney <bmasney@redhat.com>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 12/16] serial: pic32_uart: update include to use
 pic32.h from platform_data
Message-ID: <aWYs26SLZdk4_386@redhat.com>
References: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com>
 <20260112-mips-pic32-header-move-v2-12-927d516b1ff9@redhat.com>
 <d5b5942e-74ac-4b9b-b850-2417576d946b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5b5942e-74ac-4b9b-b850-2417576d946b@kernel.org>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Tue, Jan 13, 2026 at 07:38:27AM +0100, Jiri Slaby wrote:
> On 12. 01. 26, 23:48, Brian Masney wrote:
> > Use the linux/platform_data/pic32.h include instead of
> > asm/mach-pic32/pic32.h so that the asm variant can be dropped. This
> > is in preparation for allowing some drivers to be compiled on other
> > architectures with COMPILE_TEST enabled.
> 
> LGTM. Will you also enable the driver to be compiled?

Yes, probably in a month. I'm going to wait for this series to land in
Linus's tree first though.

Brian


