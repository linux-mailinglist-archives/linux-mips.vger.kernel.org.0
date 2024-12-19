Return-Path: <linux-mips+bounces-7104-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7959F8811
	for <lists+linux-mips@lfdr.de>; Thu, 19 Dec 2024 23:48:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 444AD16BE4F
	for <lists+linux-mips@lfdr.de>; Thu, 19 Dec 2024 22:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 095671BBBCF;
	Thu, 19 Dec 2024 22:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z+wojWB8"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5928D19FA92
	for <linux-mips@vger.kernel.org>; Thu, 19 Dec 2024 22:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734648497; cv=none; b=WhoFUqJV/bbGArMElr3yyOKb6uqllgLFE0ulGVPgaKt0kQGCjZtnJiCOF8PQWiGAqic+dKeokCPqjvGkQ8wHsX0cCG+lLVniJ3PxloYA3z2iRtRAeQYWmHq2IzKea3M+//SzT/A8TCNirUOatiiM5IsfTLofy+XcTkwMFWBZID8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734648497; c=relaxed/simple;
	bh=7+bNX1lc2r3zlYXbGKqTN+LD/Y5URePhxJKhMLBvuW0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=qW6zW6gvsf1PDCn2ry/fHJ5waG5bOBBSzVfRIy5EE58HxxMqRCKC8w1AeJ7VAKe+X7Hu0wpG1Q3Awt2LykOUOVzqmEI/aCiiyr/tLi1bh1H1iKigcpCeqnUpCa+usJzoyGZNCAhp6qRIxOYHzlvG1fOekUEApBmG+qY4oYnecGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z+wojWB8; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5d7e527becaso2016505a12.3
        for <linux-mips@vger.kernel.org>; Thu, 19 Dec 2024 14:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734648494; x=1735253294; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qlE9hyjmHNNi0/iuopuoV//UdL2XsxoH9zNpM9hRRsY=;
        b=Z+wojWB8aOF9H1vaWfQ64d6KZ036T20GopVZmgH+n9WKl/3nQ8w1E2EcUiKOOMla1q
         o/6TMs49hoa3GRBIo4D7Tr8GCawAtzsx1isMmKAZOTdEhqvgFwd6bCN+KGk761gQJnzN
         1dzkRSKM8Vko00LRg/+7Hw3wi+YqcDRoWjRFw7L+6JqnVj14vjHEoI1ztAvf1uJwJIxH
         +K5cwsdEzmjAvisizYuZRE1jzGkwHwjXW3yMlFluon8zPZHfVPvQ9/1ASt3JNaZb3YeK
         FwRr5CWjmIvt391NY5AqkESRaZZxanDzAanw3ivuG3QVqPzy83NbP01wbnI2EemQQ7MW
         EQeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734648494; x=1735253294;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qlE9hyjmHNNi0/iuopuoV//UdL2XsxoH9zNpM9hRRsY=;
        b=jDU1sKm7Rtvb/VjlV2Kp7XL4iWKsYVrv42Qx0JhnPrWwc29DjdVSxmt0H6SYIJQ7s9
         cyLP/sZq13Mgna7tua8b8P6SR+MeHh4WRybH8qQVQspAsHTRGHA+ZfVbOvPsXh9NR6No
         67NRuLZaVkNlxiuX2HSJb0zOwFRlK/nB9a4kMCWW9xEkc61+TanTO+Q3sSu5HV2VLRds
         5rILwVDF1yb5IQP9c8FF0x3ZAcPI6YAE2cFxW/Kh06IMvEdJadHzmQPP0xvfX/AWLGdA
         VbMqVMEPKdnJXshc/rw1yS4tVhwGQemKvOvomgoVhjXV1IbEkMFAVwGUQISY4EZDwniO
         oTGg==
X-Gm-Message-State: AOJu0YygojYPhMCHm63ok2cVzxmK0/GAZe+EbxmXR1k5Mj793DWlluTs
	GeYv4bhT9cx4mPxeN97gqIsl76GPPNTaEKjoYjInj3rVJ0ZRNuXfrR9xNNYewq/QhD0jzfGyKw5
	WfoE47VVgbO63lYbtvt5R3RpFeV1YLJY9
X-Gm-Gg: ASbGnct1whzMW1GH3TzotKZD7G6pvRSfpPYJQnnwKDUhLmHjcJ5Bk2s/+/8jeiLgt6J
	mqFPjTw7HHJvrB39EUqvw6AxOwAsXEFxUnGSZHjT3Ytju13Wqo3NL7MWk1NvC4KYsUJRbWJY=
X-Google-Smtp-Source: AGHT+IGzxu8SEPqKw+xsYZtW7QV/qjdhhXC+HTnd8RuCojQT2H+fvG9Y0fjZ8YR+3pCKYRqU7VoKutHbj56bBuEWzkA=
X-Received: by 2002:a05:6402:4403:b0:5d0:d2ed:ebb with SMTP id
 4fb4d7f45d1cf-5d81dd83a72mr1306128a12.3.1734648494333; Thu, 19 Dec 2024
 14:48:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAAZ8i80XG5eXSOuL+u23g9qs-vuTBMhjfzdiyeVoQJxkjHLSuA@mail.gmail.com>
 <CAAZ8i80EzZsaOztcm8zUOvHH38D5DWgvUdHar0Yx8FN8k4Nj6w@mail.gmail.com>
In-Reply-To: <CAAZ8i80EzZsaOztcm8zUOvHH38D5DWgvUdHar0Yx8FN8k4Nj6w@mail.gmail.com>
From: DiTBho Down in The Bunny hole <downinthebunnyhole@gmail.com>
Date: Thu, 19 Dec 2024 23:48:03 +0100
Message-ID: <CAAZ8i81Sh=3a0RGnGYELj4gROzY5xp5kkdt8F+CTnYC1L7Mt_A@mail.gmail.com>
Subject: RB532, kernel out of range
To: linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

hi
I am compiling 6.* kernels for RB532
6.02.* successfully boot
6.12.* does not, fails with "kernel out of range"

Tftpboot, see the following log, any idea?

let me know
D.

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

