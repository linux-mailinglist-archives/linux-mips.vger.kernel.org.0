Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32C71B5D83
	for <lists+linux-mips@lfdr.de>; Wed, 18 Sep 2019 08:45:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725909AbfIRGpg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 18 Sep 2019 02:45:36 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:40632 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726330AbfIRGpg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 18 Sep 2019 02:45:36 -0400
Received: by mail-lf1-f66.google.com with SMTP id d17so4798769lfa.7
        for <linux-mips@vger.kernel.org>; Tue, 17 Sep 2019 23:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to;
        bh=8/sQZvocsT/VlnAV3XT2xHYW/zXERa4pHKmMX2k3eWg=;
        b=u4vKCE/naRRLKCpCXXTafaG1grClUf9uQp8IalD61BnZU7QSSFguP70kGBG2BqNduu
         11k9sDzGzqqpZH5L+d7DyRgaRRayl/+a0tuCj0m7BqjSPAgS5eQbnS3R9lAfQRisDHIh
         W0aEfLm7Hnd2xC6QHSrWc1MiYIwWUCkY8wNjNl5fcqDxlH1xrTbqG6HG3TQJt3icAmln
         kAil9ejienInnwy+YFj6wslbHX3vlGquzEB6b+nR4lpsLI+L1AgUCNzg/om9oo6G7a0s
         44v2+6/h4FJajZ1kmDED9/ZzI+CE7IwrkFgJ8+338jkim3aQww9Bp7hBcWWxpP3THst/
         1DYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to;
        bh=8/sQZvocsT/VlnAV3XT2xHYW/zXERa4pHKmMX2k3eWg=;
        b=I1HygTs8qhCglh6/04mCi36YslAZmRQ7Zm9e8yp8sW75qxzicwL7TBDp1RFMUI5mGC
         xzI5EUFpDg8kfv1SF6RkuaGUDYgFGMYZgBqsyg6v4/b8vCH5KJT41tcDfJWZsYMaexGJ
         XZrzEL2vLU0OwC6TTlLhm8pnqhjDrwNfHRK9EYUeZtn4BVcTQGDdaPNmIZMCpJowpu4W
         X1jiHwx1JjRPRm1/GT3uX6Otq/wt/8XXF0/1Uq/MmgCyQT+MWdbKkxfQon7LBfR7tnHU
         rBWiHrWswiO7tSmlAkma/wuBEonGev+vgxFMPmpBt4XOtj0pf19rarljMMuf4iqkFTWn
         JQ9Q==
X-Gm-Message-State: APjAAAXPgAwWDjnUSC+f8gRj6JthCzZiwWssYUyi3tuvPUYt/heYr8XO
        xnsw1nldqYwwj3DpQHZID3Q=
X-Google-Smtp-Source: APXvYqwBClG+zq4vHsnmMsECcjt+hC+y7PoFmp6O1mS17y0yJ0BrNlGfKi0nCwd6hV2f9UwUaP8RRA==
X-Received: by 2002:ac2:5a07:: with SMTP id q7mr1115691lfn.177.1568789133322;
        Tue, 17 Sep 2019 23:45:33 -0700 (PDT)
Received: from ?IPv6:2a02:17d0:4a6:5700::47f? ([2a02:17d0:4a6:5700::47f])
        by smtp.googlemail.com with ESMTPSA id q26sm850350lfd.53.2019.09.17.23.45.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Sep 2019 23:45:32 -0700 (PDT)
Subject: Re: A few issues with jitterentropy_rng
To:     =?UTF-8?Q?Stephan_M=c3=bcller?= <smueller@chronox.de>
Cc:     linux-mips@vger.kernel.org,
        "Ahmed S. Darwish" <darwish.07@gmail.com>, trivial@kernel.org
References: <5ed9605e-76ed-af7d-54fb-dc948abb627e@gmail.com>
 <10474356.2b4LHTj5ua@positron.chronox.de>
From:   "Alexander E. Patrakov" <patrakov@gmail.com>
Message-ID: <8a63873a-bb87-d42b-d0bb-04d39137f858@gmail.com>
Date:   Wed, 18 Sep 2019 11:45:30 +0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <10474356.2b4LHTj5ua@positron.chronox.de>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256; boundary="------------ms090206040704060204020003"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This is a cryptographically signed message in MIME format.

--------------ms090206040704060204020003
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-PH
Content-Transfer-Encoding: quoted-printable

18.09.2019 09:03, Stephan M=C3=BCller =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> Am Dienstag, 17. September 2019, 18:07:36 CEST schrieb Alexander E. Pat=
rakov:
>=20
> Hi Alexander,
>=20
>> Hello.
>>
>> While reviewing the code for jitterentropy-rng, I found a few issues.
>>
>> 1. (linux-mips: that's why you are in the CC: of this mail) The code i=
n
>> crypto/jitterentropy.c uses the jent_get_nstime() function as a source=

>> of a high-resolution timestamp, and contains a check that the time doe=
s
>> not go backwards too often. The implementation (defined in
>> crypto/jitterentropy-kcapi.c) uses random_get_entropy() and, if it
>> returns 0, falls back to ktime_get_ns().
>>
>> The problem is - while the generic implementation of
>> random_get_entropy() is indeed another name for get_cycles() and _is_ =
a
>> monotonically increasing counter if implemented, this may not be true
>> for random_get_entropy() on mips, because it has a fallback to
>> read_c0_random(), which is not a cycle counter. This fallback to
>> read_c0_random(), if I understand correctly, by virtue of returning
>> non-zero, would prevent a more useful (?) fallback to ktime_get_ns() i=
n
>> jent_get_nstime().
>=20
> Ok. I fail to understand what is the issue. Do you see any errors that =
you
> think you should not see?

The issue was found by code inspection. I do not have hardware that=20
reproduces it. But the error would be:

jitterentropy: Initialization failed with host not compliant with=20
requirements: 3

=2E..while a fallback to ktime_get_ns() instead of random_get_entropy()=20
would have produced a working jitterentropy. Again, the issue is=20
mips-specific, and would appear only on hardware where=20
can_use_mips_counter() returns 0, read_c0_prid() is neither=20
PRID_IMP_R6000 nor PRID_IMP_R6000A, and ktime_get_ns() is not too coarse.=


>>
>> 2. There are some outdated/incorrect comments in crypto/jitterentropy.=
c
>> (patch attached).
>>
>> 2a. Above jent_lfsr_time(): the comment says that ec may be NULL, but
>> the function dereferences it unconditionally.
>=20
> You are right, this is a copy and paste error from the user space code.=

>>
>> 2b. Above jent_fips_test(): the function returns void, but the comment=

>> talks about a zero vs negative return value. It would be correct here =
to
>> talk about returning normally vs causing a kernel panic.
>=20
> Yes, again a copy and paste error from user space.
>=20
> Could you please send the patch as a patch request to linux-crypto?

Will do so.

--=20
Alexander E. Patrakov


--------------ms090206040704060204020003
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: Криптографическая подпись S/MIME

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCC
C5wwggVNMIIENaADAgECAhArQ2N9hOajPiuqD20bI16wMA0GCSqGSIb3DQEBCwUAMIGCMQsw
CQYDVQQGEwJJVDEPMA0GA1UECAwGTWlsYW5vMQ8wDQYDVQQHDAZNaWxhbm8xIzAhBgNVBAoM
GkFjdGFsaXMgUy5wLkEuLzAzMzU4NTIwOTY3MSwwKgYDVQQDDCNBY3RhbGlzIENsaWVudCBB
dXRoZW50aWNhdGlvbiBDQSBHMTAeFw0xOTA2MDYwODAxMzVaFw0yMDA2MDYwODAxMzVaMB0x
GzAZBgNVBAMMEnBhdHJha292QGdtYWlsLmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCC
AQoCggEBAOA0sb1ubDnIK32rbgW3BnjBcx1pYuEFOCU6aPVJ2gU+wtKJgAo9IdVUXG6kC1fF
hXjIcZHOgbEqzFjHK1yXlHIUWEv+N8KdmBDOK1UdKQj58d9A4hnH62iEiwQsOR5YT1UyHX4A
pfMjsBja7254cixR4jOPzfA4YUD6JTTPioyjDwuYQlhweVyXziKswLtGWfKeDcm3fOlKYxGy
hxjWJRamGTreNBVC9uMkF4DHszpUm07agR2U4mnWy7FsjBuRJ++iX0SvuxKWf19HQWgmgIys
jBVrArhVzgjOOnbvlklW849wIARF4Y0WAf91DsqPtuR8hu7+9KIVj2qk9BeNXXUCAwEAAaOC
AiEwggIdMAwGA1UdEwEB/wQCMAAwHwYDVR0jBBgwFoAUfmD8+GynPT3XrpOheQKPs3QpO/Uw
SwYIKwYBBQUHAQEEPzA9MDsGCCsGAQUFBzAChi9odHRwOi8vY2FjZXJ0LmFjdGFsaXMuaXQv
Y2VydHMvYWN0YWxpcy1hdXRjbGlnMTAdBgNVHREEFjAUgRJwYXRyYWtvdkBnbWFpbC5jb20w
RwYDVR0gBEAwPjA8BgYrgR8BGAEwMjAwBggrBgEFBQcCARYkaHR0cHM6Ly93d3cuYWN0YWxp
cy5pdC9hcmVhLWRvd25sb2FkMB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEFBQcDBDCB6AYD
VR0fBIHgMIHdMIGboIGYoIGVhoGSbGRhcDovL2xkYXAwNS5hY3RhbGlzLml0L2NuJTNkQWN0
YWxpcyUyMENsaWVudCUyMEF1dGhlbnRpY2F0aW9uJTIwQ0ElMjBHMSxvJTNkQWN0YWxpcyUy
MFMucC5BLi8wMzM1ODUyMDk2NyxjJTNkSVQ/Y2VydGlmaWNhdGVSZXZvY2F0aW9uTGlzdDti
aW5hcnkwPaA7oDmGN2h0dHA6Ly9jcmwwNS5hY3RhbGlzLml0L1JlcG9zaXRvcnkvQVVUSENM
LUcxL2dldExhc3RDUkwwHQYDVR0OBBYEFEhX9pz3jwI3+erfsAVB2b4xSsM8MA4GA1UdDwEB
/wQEAwIFoDANBgkqhkiG9w0BAQsFAAOCAQEAVbKht9PGiUsUaqiyzJb6blSMNaLwopQr3AsI
FvthyqnSqxmSNYDeZsQYPgBnXvMCvHCn07pm1b96Y3XstBt2FWb9dpDr7y+ec3vxFHb3lKGb
3WREB1kEATnBu2++dPcILG58gdzgYde3RAJC3/OyOZhDqKwQA5CnXTHigTzw75iezdLne5pU
MjEQoxdqC+sgbrAueaEpMmRsGSKzgIX8eQ3DWwyIL56fYPJP3u4WZmBUKTFhhUWowG62QLtt
ZjkiX/j+vjcSRd2app8lYDwQRornZAqrDxy+c4qQJ5FN234p36opwespDCwLN3Z6wPzLvzS+
jAlmV3DF2xuZGMoebzCCBkcwggQvoAMCAQICCCzUitOxHg+JMA0GCSqGSIb3DQEBCwUAMGsx
CzAJBgNVBAYTAklUMQ4wDAYDVQQHDAVNaWxhbjEjMCEGA1UECgwaQWN0YWxpcyBTLnAuQS4v
MDMzNTg1MjA5NjcxJzAlBgNVBAMMHkFjdGFsaXMgQXV0aGVudGljYXRpb24gUm9vdCBDQTAe
Fw0xNTA1MTQwNzE0MTVaFw0zMDA1MTQwNzE0MTVaMIGCMQswCQYDVQQGEwJJVDEPMA0GA1UE
CAwGTWlsYW5vMQ8wDQYDVQQHDAZNaWxhbm8xIzAhBgNVBAoMGkFjdGFsaXMgUy5wLkEuLzAz
MzU4NTIwOTY3MSwwKgYDVQQDDCNBY3RhbGlzIENsaWVudCBBdXRoZW50aWNhdGlvbiBDQSBH
MTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMD8wYlW2Yji9ARlv80JNasoKTD+
DMr3J6scEe6GPV3k9WxEtgxXM5WX3oiKjS2p25Mqk8cnV2fpMaEvdO9alrGes0vqcUqly7Pk
U753RGlseYXR2XCjVhs4cuRYjuBmbxpRSJxRImmPnThKY41r0nl6b3A6Z2MOjPQF7h6OCYYw
tz/ziv/+UBV587U2uIlOukaS7Xjk4ArYkQsGTSsfBBXqqn06WL3xG+B/dRO5/mOtY5tHdhPH
ydsBk2kksI3PJ0yNgKV7o6HM7pG9pB6sGhj96uVLnnVnJ0WXOuV1ISv2eit9ir60LjT99hf+
TMZLxA5yaVJ57fYjBMbxM599cw0CAwEAAaOCAdUwggHRMEEGCCsGAQUFBwEBBDUwMzAxBggr
BgEFBQcwAYYlaHR0cDovL29jc3AwNS5hY3RhbGlzLml0L1ZBL0FVVEgtUk9PVDAdBgNVHQ4E
FgQUfmD8+GynPT3XrpOheQKPs3QpO/UwDwYDVR0TAQH/BAUwAwEB/zAfBgNVHSMEGDAWgBRS
2Ig6yJ94Zu2J83s4cJTJAgI20DBFBgNVHSAEPjA8MDoGBFUdIAAwMjAwBggrBgEFBQcCARYk
aHR0cHM6Ly93d3cuYWN0YWxpcy5pdC9hcmVhLWRvd25sb2FkMIHjBgNVHR8EgdswgdgwgZag
gZOggZCGgY1sZGFwOi8vbGRhcDA1LmFjdGFsaXMuaXQvY24lM2RBY3RhbGlzJTIwQXV0aGVu
dGljYXRpb24lMjBSb290JTIwQ0EsbyUzZEFjdGFsaXMlMjBTLnAuQS4lMmYwMzM1ODUyMDk2
NyxjJTNkSVQ/Y2VydGlmaWNhdGVSZXZvY2F0aW9uTGlzdDtiaW5hcnkwPaA7oDmGN2h0dHA6
Ly9jcmwwNS5hY3RhbGlzLml0L1JlcG9zaXRvcnkvQVVUSC1ST09UL2dldExhc3RDUkwwDgYD
VR0PAQH/BAQDAgEGMA0GCSqGSIb3DQEBCwUAA4ICAQBNk87VJL5BG0oWWHNfZYny2Xo+WIy8
y8QP5VsWZ7LBS6Qz8kn8zJp3c9xdOkudZbcA3vm5U8HKXc1JdzNmpSh92zq/OeZLvUa+rnnc
mvhxkFE9Doag6NitggBPZwXHwDcYn430/F8wqAt3LX/bsd6INVrhPFk3C2SoAjLjUQZibXvQ
uFINMN4l6j86vCrkUaGzSqnXT45NxIivkAPhBQgpGtcTi4f+3DxkyTDbWtf9LuaC4l2jgB3g
C7f56nmdpGfpYsyvKE7+Ip+WryH93pWt6C+r68KU3Gu02cU1/dHvNOXWUDeKkVT3T26wZVrT
aMx+0nS3i63KDfJdhFzutfdBgCWHcp03NhOhMqy1RnAylF/dVZgkka6hKaWe1tOU21kS4uvs
D4wM5k6tl0pin2o6u47kyoJJMOxRSQcosWtDXUmaLHUG91ZC6hvBDmDmpmS6h/r+7mtPrpYO
xTr4hW3me2EfXkTvNTvBQtbi4LrZchg9vhi44EJ7L53g7GzQFn5KK8vqqgMb1c1+T0mkKdqS
edgGiB9TDdYtv4HkUj/N00TKxZMLiDMw4V8ShUL6bKTXNfb3E68s47cD+MatFjUuGFj0uFPv
ZlvlNAoJ7IMfXzIiTWy35X+akm+d49wBh54yv6icz2t/cBU1y1weuPBd8NUH/Ue3mXk0SXwk
GP3yVDGCA/YwggPyAgEBMIGXMIGCMQswCQYDVQQGEwJJVDEPMA0GA1UECAwGTWlsYW5vMQ8w
DQYDVQQHDAZNaWxhbm8xIzAhBgNVBAoMGkFjdGFsaXMgUy5wLkEuLzAzMzU4NTIwOTY3MSww
KgYDVQQDDCNBY3RhbGlzIENsaWVudCBBdXRoZW50aWNhdGlvbiBDQSBHMQIQK0NjfYTmoz4r
qg9tGyNesDANBglghkgBZQMEAgEFAKCCAi8wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAc
BgkqhkiG9w0BCQUxDxcNMTkwOTE4MDY0NTMwWjAvBgkqhkiG9w0BCQQxIgQgxscfB3qY4Rwy
2shqu84v1WShRFGl7jiCzv8AU0+aV84wbAYJKoZIhvcNAQkPMV8wXTALBglghkgBZQMEASow
CwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA4GCCqGSIb3DQMCAgIAgDANBggqhkiG9w0DAgIB
QDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDCBqAYJKwYBBAGCNxAEMYGaMIGXMIGCMQswCQYD
VQQGEwJJVDEPMA0GA1UECAwGTWlsYW5vMQ8wDQYDVQQHDAZNaWxhbm8xIzAhBgNVBAoMGkFj
dGFsaXMgUy5wLkEuLzAzMzU4NTIwOTY3MSwwKgYDVQQDDCNBY3RhbGlzIENsaWVudCBBdXRo
ZW50aWNhdGlvbiBDQSBHMQIQK0NjfYTmoz4rqg9tGyNesDCBqgYLKoZIhvcNAQkQAgsxgZqg
gZcwgYIxCzAJBgNVBAYTAklUMQ8wDQYDVQQIDAZNaWxhbm8xDzANBgNVBAcMBk1pbGFubzEj
MCEGA1UECgwaQWN0YWxpcyBTLnAuQS4vMDMzNTg1MjA5NjcxLDAqBgNVBAMMI0FjdGFsaXMg
Q2xpZW50IEF1dGhlbnRpY2F0aW9uIENBIEcxAhArQ2N9hOajPiuqD20bI16wMA0GCSqGSIb3
DQEBAQUABIIBAE6M4p4g2RMatuuafPGx+cV7sGUG5LccuNZSxF1I/O5MzfWRW5n0QKAeTlwB
tFAfM57isx+HE8OnFHH1lTNSeL3niDH9MK/kVAeP03b0FKL96phhptDbl7Xi3t2Z7A1yfmaO
6QfvVY/XYx8Drexqo7L277pQw6yospTODBujPsS8AXQVkoOA+AFlF4dAPVbWrAqYAaYIp2pF
WQ+nNAYBDss8GqX5cxVskbLpKk1SXJ/Hy/zPM3Oy4VE7InR1pLDifsKdI9IBMJOj6UqQe6vB
kHK9d29ch8B3MfQp0uVOOF+fsY9de0jEER1sljjyMITiT8O1uylBzdcA5DeVShSSglAAAAAA
AAA=
--------------ms090206040704060204020003--
