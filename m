Return-Path: <linux-mips+bounces-7080-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC629F6AC6
	for <lists+linux-mips@lfdr.de>; Wed, 18 Dec 2024 17:10:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8B50188C416
	for <lists+linux-mips@lfdr.de>; Wed, 18 Dec 2024 16:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEE9C1F37D8;
	Wed, 18 Dec 2024 16:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IbGN/238"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F801E9B1E
	for <linux-mips@vger.kernel.org>; Wed, 18 Dec 2024 16:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734538235; cv=none; b=tWlt2xRjVnxdOFbn1tjdedisxuqtuy3oVeby3ypOzx+8N8kNIvwKwhS8rqpD53FVFnQRQopg3/37se1R/Q9rEPrSH4FQR9pFRXbdGENorVYCZZyWzi/nu/MbbYJP1uzIMxErrM1R7MNQTo6/vxUPxQHnQ5EVG0CeGhZ4dRV/sfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734538235; c=relaxed/simple;
	bh=cUy5Hhj2og2FqV6qhR26oQ+shmV5zlMDTHHXZV79fDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=IgJMXlv+AZBKQq87afNg6ugxLs+4oSfGVPt+VI0kk4q5tnItb+IydyxfTIudsKO/wjiN2TE5bA7TnK9qYy/a/aaqTFRGVeSJ/erzMAOADTpdzq4KBy4p9LJ6vLbPb3BSppJ4UtIvSZ4RF/Sz4WuiFDVo+vXoV8epFBB3TWgZkXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IbGN/238; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5d7e3f1fc01so3495634a12.2
        for <linux-mips@vger.kernel.org>; Wed, 18 Dec 2024 08:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734538232; x=1735143032; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cUy5Hhj2og2FqV6qhR26oQ+shmV5zlMDTHHXZV79fDc=;
        b=IbGN/238p5oJtDTSFB6oNCGumYiLDQov0Ep+Na5jO+HaSGOzKnjL423ogMmjzOWtCS
         50yWNs3lbINA5ft+ftxxCWJ6iHzlQRq9sbfwG/6L0dG0ONc0rvUN58hEXP0xtgFTalVj
         MUQwe3CGgldKj7L+8gTteWh7J8jJz2aBz1Mhm8su8sUNoolrFJUWDwfKEqgOtuMAFdA5
         rO6+T5qAuCIMzJPkSbaK3C5jhtqcvBe1MSBbi9EbhbSWy5LzmDVdNIeINJhRkN7mQabf
         5ubmld9UkODhCAlAaiji8z5icRQjE7D7rWaAa7g8pkCYDPziUMyBa2CiK6Utc75Pe2b/
         RTMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734538232; x=1735143032;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cUy5Hhj2og2FqV6qhR26oQ+shmV5zlMDTHHXZV79fDc=;
        b=ulZJiR1/ncIKbYniMD6871hTxB7cFyYWESXMiD+dLBMGOQPWlzbk/rnG44CPAfLXlB
         G2yWfCTYGkKreyJGxJhm332w19g9qtiaD2LS04zxwNSHly3mQpJSN6Hym4ZaKRa/IaJR
         q119/S8jCBJMxpHcHoDbq+DqvZjIIMbxHk00TSaWFU9UBono55bp7GYuTC4b5lFD17GD
         TUSR0gDj0FqxbhgQkmWPnNYZArrKWMohgFWeHLD/VtkaawH+iJFh917fyYXiVLU5gg/T
         3S4TIXOFvNWDy3PicESa60u9pctQOCXGg3r4NdT+Tc4cC5+FLxAT29Rp2gUxevFIGgeM
         O0dw==
X-Gm-Message-State: AOJu0Yy1ZwTfGh1mMa3RwnZq4FEG6phFixxoc9/reUG4lBWl76exhMTQ
	BAx0Oxy13GwavnZnY+Qp+iJFCc3r1nO2GYCNsxA0VMZksRhoCt/ceqj+ADSQ7wPcaRidiXyIZdi
	TLa0jy/WZR3LTTRfl+IAo2L5NlkMb+w==
X-Gm-Gg: ASbGnctWMYYuuqhDanpVFPieYsWr7kAZ5R1O0zEhpXELwnjJRp4m4MAwEfQt4dIO0u9
	VW7OySwWin6pNcFErJMlfGIjpiAbgW88gIaAKOqnOqT/n51ct1xPttP+9HbJWKWHRYgtJfQ==
X-Google-Smtp-Source: AGHT+IFrUcfZLfN4WNwSYrvQ9kTuuPvu7KQC1rGfiU1mSoenX2fR7KPJ1WfSyyo1WaJmjJ9S52/CJhTmsCJnEw9Np/U=
X-Received: by 2002:a05:6402:2403:b0:5d0:d5af:d417 with SMTP id
 4fb4d7f45d1cf-5d7ee390524mr3039548a12.1.1734538231951; Wed, 18 Dec 2024
 08:10:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAAZ8i80XG5eXSOuL+u23g9qs-vuTBMhjfzdiyeVoQJxkjHLSuA@mail.gmail.com>
In-Reply-To: <CAAZ8i80XG5eXSOuL+u23g9qs-vuTBMhjfzdiyeVoQJxkjHLSuA@mail.gmail.com>
From: DiTBho Down in The Bunny hole <downinthebunnyhole@gmail.com>
Date: Wed, 18 Dec 2024 17:10:21 +0100
Message-ID: <CAAZ8i80EzZsaOztcm8zUOvHH38D5DWgvUdHar0Yx8FN8k4Nj6w@mail.gmail.com>
Subject: RB532, status?
To: linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

hi
I'm using the linux kernel v4.04.197, which is the most stable I have
ever used on rb532.
It seems that the rb532 firmware can't load kernels larger than 7.7Mb

What is the status of linux support for this router?

Does anyone have any idea how to load the latest kernel?

Please let me know!

D.

