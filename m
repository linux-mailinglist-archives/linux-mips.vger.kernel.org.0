Return-Path: <linux-mips+bounces-1291-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A12C848D36
	for <lists+linux-mips@lfdr.de>; Sun,  4 Feb 2024 12:45:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D0C41C209E4
	for <lists+linux-mips@lfdr.de>; Sun,  4 Feb 2024 11:45:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED7BC224C7;
	Sun,  4 Feb 2024 11:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="gvDqrOcG"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C82022319
	for <linux-mips@vger.kernel.org>; Sun,  4 Feb 2024 11:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707047134; cv=none; b=RbGrLbOuJuiJsWBiF80XVb6pwpACdZKQBrHaocEz77GW5PaZbRo/PwKgCVJOai2cwSVXMvuDtSIg3//E7vG0wV+Q5GMe3EKEtg5ANScB8uZiQGkQ8OzW85O33uXkKtXhXF85VH8QcYytgM99KNGFcxqMBGCxSg7JFAFwSToOeRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707047134; c=relaxed/simple;
	bh=qgF9mgJuwBON3XPXrWsmUJR+tGrDKBmgIGDGKxUWbwg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a+bOXBYZJ+gwwAA16WV7Jl3YPFEwy7WXfEOUsO743jnc/fWovrQc0wJ6jEz74TuPr69IF2BdfQE9fv6nrJ2LyQfkvMYLRxV3TPzONQYAbmec9xOReG7gL+odrn/2y1iBkVQIGLv3c6aXN+epNnz1/npHkumvzOh07boB7evU9k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=gvDqrOcG; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a370e7e1e02so211355066b.0
        for <linux-mips@vger.kernel.org>; Sun, 04 Feb 2024 03:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1707047131; x=1707651931; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VWi8x1miBJ1PGJBMtpIeIYYJwAHPliiF8cHXBoeQK6g=;
        b=gvDqrOcGI+qfW2Yg1FJSAzMhM5mvboG757dGgBtsDT0Lh5JQWT6oeHO58uMWtg4ow9
         UQkRjgYXyTq1p6kDCKMASLMum4BM5tHsWDN9JV5ghrKi/5HW/kvbDbuVZtke3CI1rdgd
         X7aOOM0hEbdRGMjYLjcO7fd2BID/J5GN8L1Yg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707047131; x=1707651931;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VWi8x1miBJ1PGJBMtpIeIYYJwAHPliiF8cHXBoeQK6g=;
        b=vDcX1/lqRtYatIhquuRpUgR3d2H6jp1ZfyNsqS6qFu8MDg7+NyEZ7e/zpJwwGpPqMB
         Ceo7Yn/y4alMb9Zl93QtNs5Ng+TO4Oiu2Nu0ftzQPjzb0jSA3V7JQfdEdKlW5gadomkN
         9ZFJ2JfsdlBJ8Zk+espP/51HnnL0hQCYMta4RVdVyTE/NAzsDcOPZcXujxQmP7nESx2Y
         ckkBb0vBMKpk9bHwwhzXtZqOtEUk9D+sVY0eBsDPPWjdiHabwOfCv7GtYUp7dMwmwvpT
         L/MJhErrxuz2Wa/cS/fSK+FIglyW4vpHWDl9YGr1hkR4ILp2H7zZl7Dj1eY14XcbnMoj
         4uIA==
X-Forwarded-Encrypted: i=0; AJvYcCXgLrzO70TH+ZbUstSIflHjko3zxqvAdTBYaGLWPsLcxtLEBFG4gn7HDptmwcv6RYgoP20rvgntyvY6h8J26wB8w6y7JqmeBiCLzw==
X-Gm-Message-State: AOJu0YzjQ5eDjOfkXYA3WBMfvzfal7xgQ1RU+j+PNNkW8V2ypsfn67gw
	hISmcA1TKlsO8YpLlzYeM+BiPilzKwYlKRvB1eLT9fCGM9wedMTX5i85pCWd4hd08OPfaXz9kUh
	NK5g=
X-Google-Smtp-Source: AGHT+IE+1c6azOUaV5v8rNskKx7evgTS8dlh614CGw6Q1OMdmdxXlAzCdE/p1GUH8t4U+S3g3YzOcg==
X-Received: by 2002:a17:906:5d:b0:a37:2bb1:7517 with SMTP id 29-20020a170906005d00b00a372bb17517mr4825493ejg.45.1707047131296;
        Sun, 04 Feb 2024 03:45:31 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVz20r5173DSRL+FA0AkNx8yMUpb0aYhVjTSe33mAQs2M+Sn04pvEfceNfvKYvR0gzl76SqxYXHOvVCE+GZucZ2+5oqSv2v76A6KQ==
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id lj8-20020a170907188800b00a37409166fasm1910182ejc.132.2024.02.04.03.45.29
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Feb 2024 03:45:30 -0800 (PST)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-55a90a0a1a1so4404986a12.0
        for <linux-mips@vger.kernel.org>; Sun, 04 Feb 2024 03:45:29 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXYT3hWVV0DpYFqTdobsZAb5JG/zyojXCvqoi0E4IDX5fB3xZvJhCey+PN+/1FbO1x3BOGCNhBKhgYZ0QP8mrUiN0Q4zlUcY+96Kg==
X-Received: by 2002:aa7:d294:0:b0:55f:8bba:d0ae with SMTP id
 w20-20020aa7d294000000b0055f8bbad0aemr3329700edq.23.1707047129481; Sun, 04
 Feb 2024 03:45:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240202-exception_ip-v2-0-e6894d5ce705@flygoat.com>
 <CAHk-=wiaSjYApqmUYCdCyYfr_bRsfVKDkwU6r6FMmoZzrxHrKQ@mail.gmail.com>
 <eeb92d70-44d6-47f4-a059-66546be5f62a@flygoat.com> <CAHk-=wiUb1oKMHqrxZ6pA7OjNmtgw6giTKWiagUC2kt-ePCakg@mail.gmail.com>
 <716af17c-136b-4852-86ce-a23bafe34fbb@flygoat.com>
In-Reply-To: <716af17c-136b-4852-86ce-a23bafe34fbb@flygoat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 4 Feb 2024 11:45:13 +0000
X-Gmail-Original-Message-ID: <CAHk-=wjvt75XFUWxPQQJZE0Wdi8HtSLtqQm2L-ZrqH7=2g3ByQ@mail.gmail.com>
Message-ID: <CAHk-=wjvt75XFUWxPQQJZE0Wdi8HtSLtqQm2L-ZrqH7=2g3ByQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Handle delay slot for extable lookup
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Oleg Nesterov <oleg@redhat.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Ben Hutchings <ben@decadent.org.uk>, 
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	Xi Ruoyao <xry111@xry111.site>
Content-Type: text/plain; charset="UTF-8"

On Sun, 4 Feb 2024 at 11:03, Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
> Well this is the tricky part of my assumption.
> In `exception_epc()` `__isa_exception_epc()` stuff is only called if we
> are in delay slot.
> It is impossible for a invalid instruction_pointer to be considered as
> "in delay slot" by hardware.

Ok, I guess I'm convinced this is all safe. Not great, and not exactly
giving me the warm fuzzies, but not buggy.

         Linus

