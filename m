Return-Path: <linux-mips+bounces-4242-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6E992CAF1
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jul 2024 08:23:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB09D1F2213F
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jul 2024 06:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1606B6214D;
	Wed, 10 Jul 2024 06:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MFd1WkVz"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DFC6EB4A
	for <linux-mips@vger.kernel.org>; Wed, 10 Jul 2024 06:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720592621; cv=none; b=aeLrDcaNCSBi9ZZYOqyLy+VRaHl9g3oP+sC5NS4h2hVh8B4rMwtVkvPf60pZAviTJPvjPXuJ7qypcXUfBQUS30Aicrk0/JiGwrC7hG3mbyxvS7r7K6uWp3pzBLemMfk4h0jKoVPQhPQQvvec+ELdA0fcUOvEC0peTM4xa5n7q0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720592621; c=relaxed/simple;
	bh=Vh2PxRkX6tPQ21qX4H/N8GPRCj89j3ozdiQOdbkgRcU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=crQMl3XhBi1LDVKh8Bc9CErp6EdjRYJ4NX7Xomt8F56yGse0vCWwWhMWCjZ8IiZKTgvKHxC9PDhCM2ttc6Mgo45CGm7GH2q8pup1YvyXcQZTLnXWCuFCKEhFzf9oL2NeLkaoBqTYYbwc/FVGDrgwnUYLS/XOSRZzapu8jeOEG7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MFd1WkVz; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-48ffceb3fdaso1820450137.0
        for <linux-mips@vger.kernel.org>; Tue, 09 Jul 2024 23:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720592618; x=1721197418; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rfO/tubJkRWNsflDwLIYJeDnbtKjZsGMZyxTOtYX+yQ=;
        b=MFd1WkVzRL3huC4Mc1CQJiSA5Fko0AaapOI6/24TKwagSD6PKkjgKM90gBjIW353zO
         vTRH/8rTRi4Sy5Cxe0FGTZyrMkM9OhkPgA5SoMey/J5c73UXPzq00wAR9/8XqKsRlrtf
         NlnLKLn4ZqikWRhVtQQ2c8j/IazkIpKgx0WdmlqNhah9G6wk9QdSKqmXPePkMZMNaXtk
         xnQRMT6G4SXLEtZQfvnX74HmHNh3qkVyrbPkzmJI7ZI8ge+yfQ9VjGDuooRRr0Tatp0p
         Ow2JYU7V4a68CPQ+y6in76UUtv8CtdXoH7h4vX683sFqHkgULRFDZP/jpniaw0MShTaO
         ZgWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720592618; x=1721197418;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rfO/tubJkRWNsflDwLIYJeDnbtKjZsGMZyxTOtYX+yQ=;
        b=msV0Chm4a7a4kaMJEavQEaC263sPxRMtDIjRWPZd829XI2W4eHp0pgrB5vsj5+kRy6
         vrD6SVQW3a+aPl+TrF3m4RSbtxidye3a5kSpwBw6bwQMYrxUISNBNM2PoT82kWM0lk0q
         E0lnYBJ5EfEqALCAlOgWpXUwfWtQzWh0ls0+rpIE9/A+yMX5UyAppv3tayLro1pAkW4I
         Cq8AIqZO/pbwu5/uRo/+3hzJfcwajx67k8rRaSJTqr+Lkhcdn4IhR8S7oy8mdZz05iF+
         CFuOSP4WjUmYEtsCQTkMdOIDkgo0XVDpNs9azQEO6uxCM35TEOEDjeACzgRxoVm5bL5B
         1HxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEyLiZetP6CKlM17AjSnMwyf9Y9N/7zxXQ465W/pY7Bc59htg4pMGqall+e6uiyZh5E4Cef2LNGtZacEigeFqnCmKnJYvqPqOuyQ==
X-Gm-Message-State: AOJu0YxvqMKJqrK5bZLyO2GqoAHcPkQjiPyU3UAwDzb1h7GuGSjTm/Dk
	vpsO0HpotSXQ5vsAqbfTgiM3LiqUIgS3aG3Ac2fBqmbKMMY5sRchTwbxqXg9OI3VqLLRKPA9NV4
	YuxNJvYThhJMCLGRFamVR/VSVyUaA3yf9lUjxlA==
X-Google-Smtp-Source: AGHT+IHHBbLJpcxImsi97rq9EoasWijE1hp+uHEFhkSG2ol4YRtSD65QsSk4l3zo4kM3na3TwQ5YhMfh0rPcDkFpGiM=
X-Received: by 2002:a05:6102:26d1:b0:48f:6581:c16c with SMTP id
 ada2fe7eead31-490320f2e96mr4920436137.6.1720592617827; Tue, 09 Jul 2024
 23:23:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 10 Jul 2024 11:53:26 +0530
Message-ID: <CA+G9fYsptR8VoPA0TBV0qeCy7TX2EHyD4v-EMsVbomeS5yVSLg@mail.gmail.com>
Subject: mips-gic-timer.c:180:11: error: call to undeclared function 'read_gic_redir_counter'
To: open list <linux-kernel@vger.kernel.org>, linux-mips@vger.kernel.org, 
	lkft-triage@lists.linaro.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Serge Semin <Sergey.Semin@baikalelectronics.ru>, 
	Serge Semin <fancer.lancer@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>
Content-Type: text/plain; charset="UTF-8"

The arch mips builds failed on Linux next-20240709 tag due to below
build warnings / errors [1] with clang-18 and gcc-12 / gcc-8.

This is started from Linux next-20240709.
  GOOD: next-20240703
  BAD: next-20240709

Build details,
-------
kernel: 6.10.0-rc7
git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
git_ref: master
git_sha: 82d01fe6ee52086035b201cfa1410a3b04384257
git_describe: next-20240709
Test details: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240709

Regressions (compared to build next-20240703)
------------------------------------------------------------------------

mips:
  build:
    * clang-18-allnoconfig
    * clang-nightly-defconfig
    * gcc-8-allnoconfig
    * gcc-12-malta_defconfig
    * clang-18-tinyconfig
    * gcc-12-defconfig
    * clang-nightly-allnoconfig
    * gcc-12-tinyconfig
    * gcc-8-malta_defconfig
    * gcc-12-allnoconfig
    * clang-18-defconfig
    * gcc-8-tinyconfig
    * clang-nightly-tinyconfig
    * gcc-8-defconfig

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build warnings / errors [2]:
---------
drivers/clocksource/mips-gic-timer.c:180:11: error: call to undeclared
function 'read_gic_redir_counter'; ISO C99 and later do not support
implicit function declarations [-Wimplicit-function-declaration]
  180 |                 count = read_gic_redir_counter();
      |                         ^
drivers/clocksource/mips-gic-timer.c:184:7: error: call to undeclared
function 'read_gic_redir_counter_32h'; ISO C99 and later do not
support implicit function declarations
[-Wimplicit-function-declaration]
  184 |         hi = read_gic_redir_counter_32h();
      |              ^

Links:
----
[1] https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240709/testrun/24543079/suite/build/test/clang-18-defconfig/log
[2] https://storage.tuxsuite.com/public/linaro/lkft/builds/2j0Ox1y8pT9eOUt60DNHQZjFjD1/

--
Linaro LKFT
https://lkft.linaro.org

